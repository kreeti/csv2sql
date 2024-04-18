defmodule DashboardWeb.Live.MainLive do
  use DashboardWeb, :live_view
  import Dashboard.Helpers
  alias DashBoard.Config
  alias DashBoard.DbAttribute
  alias Csv2sql.Database.ConnectionTest
  alias DashboardWeb.Live.ConfigLive

  @debounce_time 1000

  @impl true
  def mount(_params, _session, socket) do
    local_storage_config = (get_connect_params(socket) || %{}) |> Map.get("localConfig", %{})

    local_storage_config =
      for {key, val} <- local_storage_config, into: %{}, do: {String.to_atom(key), val}

    # Check for DB connection on config load from local storage
    timer_ref = Process.send_after(self(), :check_db_connection, @debounce_time)

    {:ok,
     assign(socket,
       page: "config",
       modal: false,
       path_validator_debouncer: nil,
       db_connection_debouncer: timer_ref,
       db_connection_established: false,
       changeset: Config.get_defaults() |> Map.merge(local_storage_config) |> Config.changeset(),
       matching_date_time: nil,
       constraints: Csv2sql.Config.Loader.get_constraints(),
       time_spend: 0,
       state: %Csv2sql.ProgressTracker.State{status: :init, start_time: nil},
       memory_usage: 0,
       cpu_usage: 0
     )}
  end

  @impl true
  def handle_event("start", _unsigned_params, %{assigns: assigns} = socket) do
    socket_state = assigns.state

    cond do
      assigns.changeset.valid? and socket_state.status == :init ->
        Csv2sql.ProgressTracker.add_subscriber()

        Task.start(fn ->
          socket.assigns.changeset
          |> prepare_args()
          |> Csv2sql.Config.Loader.load()

          Csv2sql.Stages.Analyze.analyze_files()
        end)

        send(self(), :update_state)

        {:noreply, socket}

      socket_state.status == :working ->
        {:noreply, socket}

      true ->
        Csv2sql.ProgressTracker.reset_state()

        {:noreply,
         assign(socket,
           state: %Csv2sql.ProgressTracker.State{status: :init, start_time: nil},
           time_spend: 0,
           memory_usage: 0,
           cpu_usage: 0
         )}
    end
  end

  @impl true
  def handle_event("page-change", ~m{page}, socket) do
    {:noreply, assign(socket, ~M{page})}
  end

  @impl true
  def handle_event("open-modal", ~m{modal}, socket) do
    {:noreply, assign(socket, :modal, modal)}
  end

  @impl true
  def handle_event("close-modal", _attrs, socket) do
    {:noreply, assign(socket, :modal, false)}
  end

  @impl true
  def handle_event("validate-and-save", attrs, socket) do
    args = Map.get(attrs, "config", %{})

    socket =
      socket
      |> assign(
        page: "config",
        changeset: Config.changeset(args)
      )
      # DB connection checker is expensive and returns result to caller process with delay
      # so we don't do this validation on changeset level
      |> db_connection_checker(args)
      |> update_matching_date_time(attrs)

    {:noreply, socket |> push_event("save-config", %{config: socket.assigns.changeset})}
  end

  @impl true
  def handle_event("add-new-" <> field, _attrs, ~M{assigns} = socket)
      when field in ~w[db-attr date-pattern date-time-pattern] do
    new_field =
      field
      |> String.replace("-", "_")
      |> String.to_atom()
      |> case do
        :db_attr -> %DbAttribute{id: Nanoid.generate(), name: "", value: ""}
        :date_pattern -> %DashBoard.DatePattern{id: Nanoid.generate()}
        :date_time_pattern -> %DashBoard.DateTimePattern{id: Nanoid.generate()}
      end

    association = "#{field}s" |> String.replace("-", "_") |> String.to_atom()

    updated_association =
      assigns.changeset
      |> Ecto.Changeset.get_field(association, [])
      |> Enum.concat([new_field])

    updated_changeset =
      Ecto.Changeset.put_embed(assigns.changeset, association, updated_association)

    {:noreply,
     socket
     |> assign(changeset: updated_changeset)
     |> push_event("scroll-to-bottom", %{id: "#{field}s-container"})}
  end

  @impl true
  def handle_event("remove-" <> field, ~m{attrid}, ~M{assigns} = socket)
      when field in ~w[db-attr date-pattern date-time-pattern] do
    association = "#{field}s" |> String.replace("-", "_") |> String.to_atom()

    updated_association =
      assigns.changeset
      # For relations get_change/2 return the original changeset data with changes applied, fetch_change!/2 returns raw db_config changesets
      |> Ecto.Changeset.fetch_change!(association)
      |> Enum.reject(fn embed_changeset ->
        Ecto.Changeset.get_field(embed_changeset, :id) == attrid
      end)

    updated_changeset =
      Ecto.Changeset.put_embed(assigns.changeset, association, updated_association)

    {:noreply,
     socket
     |> assign(changeset: updated_changeset)
     |> update_matching_date_time()}
  end

  @impl true
  def handle_info(:finish, socket) do
    {:noreply, assign(socket, state: Csv2sql.ProgressTracker.get_state())}
  end

  @impl true
  def handle_info(:update_state, socket) do
    state = socket.assigns.state

    time_taken =
      if is_nil(state.start_time) do
        0
      else
        DateTime.utc_now()
        |> Time.diff(state.start_time, :millisecond)
        |> Kernel./(1000)
        |> Float.round()
      end

    if state.status in [:init, :working] do
      Process.send_after(self(), :update_state, 200)
    end

    {:noreply,
     assign(socket,
       state: Csv2sql.ProgressTracker.get_state(),
       time_spend: time_taken,
       cpu_usage: :cpu_sup.util() |> Float.round(2),
       memory_usage: :erlang.memory(:total) |> Sizeable.filesize()
     )}
  end

  @impl true
  def handle_info(:check_db_connection, ~M{assigns} = socket) do
    with(
      db_url = create_db_url(assigns.changeset.changes, hide_password: false),
      true <- not ("NA" == db_url),
      db_type <- Ecto.Changeset.get_field(assigns.changeset, :db_type),
      false <- is_nil(db_type),
      args = %{db_type: db_type, db_url: db_url},
      resp = ConnectionTest.check_db_connection(self(), args),
      :ok <- resp
    ) do
      socket
    else
      {:error, :on_going} ->
        Process.send_after(self(), :check_db_connection, @debounce_time)
        socket

      _ ->
        assign(socket, db_connection_established: false)
    end

    {:noreply, socket}
  end

  # DB connection callbacks
  @impl true
  def handle_info({:connected, _}, socket),
    do: {:noreply, assign(socket, db_connection_established: true)}

  @impl true
  def handle_info({:error, _}, ~M{assigns} = socket) do
    {:noreply,
     assign(
       socket,
       changeset:
         Ecto.Changeset.add_error(assigns.changeset, :db_url, "Could not connect to database"),
       db_connection_established: false
     )}
  end

  @impl true
  def handle_info({:report_error, reason}, socket) do
    IO.inspect("Reported Error #{inspect(reason)}")
    {:noreply, socket}
  end

  def item_success_class(status) do
    if status == :done, do: "list-group-item-success", else: ""
  end

  def error_status_class(status) do
    if is_tuple(status), do: "error-status", else: ""
  end

  def spinner_loading_class(status) do
    if status == :working, do: "spinner loading", else: ""
  end

  defp render_page(assigns) do
    case assigns.page do
      "config" ->
        ConfigLive.config_page(assigns)

      "start" ->
        ~H"""
        <div class="main-container">
          <div class="current-stats">
            <div>
              <strong> Status: </strong>
              <span class={"overall-status #{error_status_class(@state.status)}"}>
                <%= if is_tuple(@state.status) do %>
                  Error! check logs
                <% else %>
                  <%= @state.status %>
                <% end %>
              </span>
            </div>
            <%= if @state.status != :init do %>
              <div><strong> Total Files: </strong><%= Enum.count(Map.values(@state.files)) %> </div>
              <div><strong> Files Imported: </strong><%= Enum.count(Map.values(@state.files), fn %{status: status} -> status == :done end) %> </div>
              <div><strong> CPU Usage: </strong> <%= @cpu_usage %>% </div>
              <div><strong> Memory Usage of Application: </strong>  <%= @memory_usage %></div>
              <div><strong> Time Elapsed: </strong> <%= @time_spend %> seconds </div>
            <% end %>
          </div>

          <div class="file-list list-group">

            <%= Enum.map Map.values(@state.files), fn %{name: name, path: path, size: size, row_count: row_count, rows_processed: rows_processed, status: status} -> %>
              <div class={"file-list-item list-group-item list-group-item-action #{item_success_class(status)} "}>
                <%= if status == :done do %>
                <i class="fa fa-check-circle fa-2x finish-check" aria-hidden="true"></i>
                <% end %>
                <span class="file-name"> <strong> Name: </strong>
                  <%= name %>
                </span>
                <span class="file-path"> <strong> Path: </strong> <a href={"file:///#{path}"} target="_blank">
                    <%= path %>
                  </a> </span>
                <span class="file-size"> <strong> Size: </strong>
                  <%= size %>
                </span>
                <span class="row_count"> <strong> Total Number of Records: </strong>
                  <%= row_count %>
                </span>
                <span>
                  <strong class="status"> Status: </strong>
                  <%= case status do %>
                    <% :pending -> %> <span class="stage_pending"> Pending </span>

                    <% :analyze -> %> <span class="stage_infer_schema"> Infering Schema </span>

                    <% :loading -> %>
                      <span class="stage_insert_data"> Inserting Data </span>
                      <span class="records_inserted"> <strong> Record Inserted: </strong>
                        <%= rows_processed %>
                      </span>
                      <div class="progress">
                        <% percentage_progress=if(row_count==0, do: 100, else: (rows_processed / row_count) * 100) %>
                        <div class="progress-bar progress-bar-striped progress-bar-animated bg-success"
                          role="progressbar" style={"width: #{percentage_progress}"}>
                          <span class="progress-percentage justify-content-center d-flex position-absolute w-100">
                            <%= Float.round(percentage_progress * 1.0 , 2) %>%
                          </span>
                        </div>
                      </div>

                    <% :done -> %> <span class="stage_finished"> Finisihed </span>
                  <% end %>
                </span>
              </div>
            <% end %>

          </div>

        </div>
        <footer class="main-footer fixed-bottom">
          <div class="container" phx-click="start">
            <div id="divSpinner" class={spinner_loading_class(@state.status)} >
              <div id="spinnerText">
              <%= cond do %>
                <% @state.status == :init -> %> <span> Start!</span>
                <% @state.status == :working -> %> <span> Working.. </span>
                <% @state.status == :finish -> %> <span> Finished!  Reset? </span>
                <% true -> %> <span id="error_stage"> ERROR! Reset?</span>
              <% end %>
              </div>
            </div>
          </div>
        </footer>
        """

      "about" ->
        ~H"""
        About
        """
    end
  end

  defp db_connection_checker(~M{assigns} = socket, args) do
    if db_config_updated?(assigns, args) do
      if assigns.db_connection_debouncer,
        do: Process.cancel_timer(assigns.db_connection_debouncer)

      timer_ref = Process.send_after(self(), :check_db_connection, @debounce_time)
      assign(socket, :db_connection_debouncer, timer_ref)
    else
      socket
    end
  end

  defp db_config_updated?(~M{changeset}, args) do
    # TODO: Take into account custom db params
    Ecto.Changeset.get_field(changeset, :db_type) != Map.get(args, "db_type") ||
      Ecto.Changeset.get_field(changeset, :db_username) != Map.get(args, "db_username") ||
      Ecto.Changeset.get_field(changeset, :db_password) != Map.get(args, "db_password") ||
      Ecto.Changeset.get_field(changeset, :db_host) != Map.get(args, "db_host") ||
      Ecto.Changeset.get_field(changeset, :db_name) != Map.get(args, "db_name")
  end

  defp update_matching_date_time(~M{assigns} = socket, attrs \\ %{}) do
    date_time_sample =
      get_in(attrs, ["config", "date_time_trial"]) ||
        Ecto.Changeset.get_field(assigns.changeset, :date_time_trial)

    case match_date_time(assigns.changeset, date_time_sample) do
      {type, index} ->
        socket
        |> assign(matching_date_time: {type, index})
        |> push_event("scroll-into-view", %{
          id: "config_#{type}_patterns_#{index}_pattern"
        })

      false ->
        assign(socket, matching_date_time: nil)
    end
  end

  defp prepare_args(changeset) do
    config = Ecto.Changeset.apply_changes(changeset)

    %{
      source_directory: config.source_directory,
      schema_path: config.schema_path,
      insert_schema: config.insert_schema,
      insert_data: config.insert_data,
      ordered: config.ordered,
      date_patterns: prepare_date_patterns(config.date_patterns),
      datetime_patterns: prepare_date_patterns(config.date_time_patterns),
      schema_infer_chunk_size: config.schema_infer_chunk_size,
      worker_count: config.worker_count,
      parse_datetime: config.parse_datetime,
      remove_illegal_characters: config.remove_illegal_characters,
      db_type: config.db_type,
      db_name: config.db_name,
      db_url: create_db_url(changeset.changes),
      drop_existing_tables: config.drop_existing_tables,
      varchar_limit: config.varchar_limit,
      db_worker_count: config.db_worker_count,
      insertion_chunk_size: config.insertion_chunk_size,
      log: config.log
    }
  end

  defp prepare_date_patterns(date_patterns) do
    date_patterns
    |> Enum.reject(&is_nil(&1.pattern))
    |> Enum.map(&%{id: &1.id, pattern: &1.pattern})
  end
end

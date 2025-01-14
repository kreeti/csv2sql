defmodule Csv2sql.Database.ConnectionTest do
  @moduledoc """
    Tests the connection to the database
  """

  use GenServer
  alias Csv2sql.Database

  @type connect_args() :: %{
          :db_type => :mysql | :postgres,
          :db_url => String.t(),
          :caller => pid()
        }

  # Public API
  @spec(check_db_connection(pid()) :: :ok, {:error, :on_going | String.t()})
  def check_db_connection(caller) do
    args = Application.get_env(:csv2sql, :config)
    test_connection(caller, args)
  end

  @spec check_db_connection(pid(), map()) :: {:error, :on_going | String.t()}
  def check_db_connection(caller, args), do: test_connection(caller, args)

  @spec attempt_connection(connect_args()) ::
          {:connected, pid()} | {:error, DBConnection.ConnectionError.t()}
  def attempt_connection(%{db_url: db_url, db_type: db_type}) do
    repo = Database.get_repo(db_type)

    conn =
      repo.start_link(
        url: db_url,
        pool_size: 1,
        # Show helpful debug information
        show_sensitive_data_on_connection_error: true,
        # Disable backoff
        backoff_type: :stop,
        # Don't try to restart if connection failed
        max_restarts: 0
      )
      |> case do
        {:ok, conn} -> conn
        {:error, {:already_started, conn}} -> conn
      end

    return_value =
      try do
        # Ping DB
        Database.run_query!(repo, "SELECT 1")
        {:connected, conn}
      rescue
        e in DBConnection.ConnectionError ->
          {:error, e}
      end

    # Stop DB process after connection check
    repo.stop(:infinity)
    return_value
  end

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(_args) do
    GenServer.start_link(__MODULE__, :no_args, name: __MODULE__)
  end

  # GenServer Callbacks
  @impl GenServer
  def init(_) do
    {:ok, init_state()}
  end

  @impl GenServer
  def handle_call({:check_db_connection, _args}, _from, %{ref: ref} = state)
      when is_reference(ref),
      do: {:reply, {:error, :on_going}, state}

  @impl GenServer
  def handle_call({:check_db_connection, %{db_url: db_url, db_type: db_type, caller: caller}}, _from, %{ref: nil} = state)
      when not is_nil(db_url) do
    task =
      Task.Supervisor.async_nolink(
        Csv2sql.Database.ConnectionSupervisor,
        __MODULE__,
        :attempt_connection,
        [%{db_url: db_url, db_type: db_type}]
      )

    {:reply, :ok, %{state | ref: task.ref, caller: caller}}
  end

  @impl GenServer
  def handle_call({:check_db_connection, _args}, _from, _state),
    do: {:reply, {:error, "Database configuration not found"}, init_state()}

  # The task completed successfully
  @impl GenServer
  def handle_info({task_ref, {:connected, db_conn}}, %{ref: ref, caller: caller})
      when is_reference(ref) and task_ref == ref do
    Process.send(caller, {:connected, db_conn}, [])

    # We don't care about the DOWN message now, so let's demonitor and flush it
    Process.demonitor(ref, [:flush])

    {:noreply, init_state()}
  end

  # The task failed
  @impl GenServer
  def handle_info({task_ref, {:error, e}}, %{ref: ref, caller: caller})
      when is_reference(ref) and task_ref == ref do
    # We don't care about the DOWN message now, so demonitor and flush it
    Process.demonitor(ref, [:flush])
    handle_error(caller, e)
  end

  # The task shutdown
  @impl GenServer
  def handle_info({:DOWN, ref, :process, _pid, reason}, %{caller: caller})
      when is_reference(ref) do
    handle_error(caller, reason)
  end

  # Private helpers
  defp test_connection(caller, args),
    do: GenServer.call(__MODULE__, {:check_db_connection, Map.put(args, :caller, caller)})

  defp handle_error(caller, message) do
    reason = "Database connection failed with error: #{inspect(message)}"
    Process.send(caller, {:error, reason}, [])
    {:noreply, init_state()}
  end

  defp init_state, do: %{ref: nil, caller: nil}
end

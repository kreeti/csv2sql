defmodule Csv2sql.ProgressTracker do
  @moduledoc """
    This module is responsible for tracking the progress of the operations on different csv files.
    The various processes working on the csv files can update the progress tracker with the status of the file.
  """

  use GenServer
  use Csv2sql.Types
  alias Csv2sql.ProgressTracker.State
  require Logger

  import ShorterMaps

  # Sets the files list
  @spec init_files(list(Csv2sql.File.t())) :: files_map()
  def init_files(files), do: GenServer.call(__MODULE__, {:init_files, files})

  # Get observer state
  @spec get_state() :: State.t() | nil
  def get_state() do
    if Process.whereis(__MODULE__),
      # Timeout is infinity here makes the caller wait until the genserver responds
      do: GenServer.call(__MODULE__, :get_state, :infinity),
      else: nil
  end

  def reset_state() do
    GenServer.cast(__MODULE__, :reset_state)
  end

  # Update file
  @spec update_file(Csv2sql.File.t()) :: :ok
  def update_file(file),
    do: GenServer.cast(__MODULE__, {:update_file, file})

  @spec update_row_count(String.t(), non_neg_integer()) :: :ok
  def update_row_count(path, rows_inserted),
    do: GenServer.cast(__MODULE__, {:update_row_count, path, rows_inserted})

  @spec add_subscriber() :: :ok
  def add_subscriber(),
    do: GenServer.call(__MODULE__, :add_subscriber, :infinity)

  @spec report_error(any()) :: :ok
  def report_error(error),
    do: GenServer.call(__MODULE__, {:report_error, error})

  # Start Observer
  @spec start_link(any()) :: {:ok, pid()}
  def start_link(_), do: GenServer.start_link(__MODULE__, nil, name: __MODULE__)

  # === Callbacks ===

  @impl true
  def init(_),
    do: {:ok, %State{start_time: nil}}

  @impl true
  def handle_call(:get_state, _from, state), do: {:reply, state, state}

  @impl true
  def handle_call({:init_files, files}, _from, %State{} = state) do
    state =
      if files == [] do
        ~M{%State state | status: :finish, end_time: DateTime.utc_now()}
      else
        files = Enum.into(files, %{}, fn ~M{%Csv2sql.File path} = file -> {path, file} end)
        ~M{%State state | files, status: :working, start_time: DateTime.utc_now()}
      end

    {:reply, files, state}
  end

  @impl true
  def handle_call(:add_subscriber, {caller_pid, _ref_tag}, ~M{%State subscribers} = state),
    do: {:reply, :ok, %State{state | subscribers: [caller_pid | subscribers]}}

  @impl true
  def handle_call({:report_error, _error}, _from, ~M{%State status: :error} = state),
    do: {:reply, :already_errored, state}

  @impl true
  def handle_call({:report_error, error}, _from, ~M{%State subscribers} = state) do
    Enum.each(subscribers, fn subscriber -> Process.send(subscriber, {:report_error, error}, []) end)
    {:reply, :ok, %State{state | status: {:error, error}}}
  end

  @impl true
  def handle_cast(:reset_state, state) do
    files = %{}

    {:noreply, ~M{%State state | files, status: :init, start_time: nil, end_time: nil}}
  end

  @impl true
  def handle_cast({:update_file, _file}, ~M{%State status: :error} = state), do: {:noreply, state}

  @impl true
  def handle_cast({:update_file, ~M{%Csv2sql.File path} = file}, ~M{%State files} = state) do
    {_old_file, files} = Map.get_and_update!(files, path, fn old_file -> {old_file, file} end)
    {:noreply, ~M{%State state | files}}
  end

  @impl true
  def handle_cast({:update_row_count, _path, _rows_inserted}, ~M{%State status: :error} = state),
    do: {:noreply, state}

  @impl true
  def handle_cast({:update_row_count, path, rows_inserted}, ~M{%State files, subscribers} = state) do
    {_current_value, files} =
      Map.get_and_update!(files, path, fn ~M{%Csv2sql.File row_count, rows_processed} = file ->
        rows_processed = rows_processed + rows_inserted
        status = if rows_processed == row_count, do: :done, else: :loading

        {file, ~M{%Csv2sql.File file | rows_processed, status}}
      end)

    state =
      files
      |> Enum.all?(fn {_path, ~M{%Csv2sql.File status}} -> status == :done end)
      |> if do
        end_time = DateTime.utc_now()
        Enum.each(subscribers, fn subscriber -> Process.send(subscriber, :finish, []) end)

        ~M{%State state | status: :finish, subscribers: [], files, end_time}
      else
        ~M{%State state | files}
      end

    {:noreply, state}
  end
end

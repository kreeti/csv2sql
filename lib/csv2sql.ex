defmodule Csv2sql do
  require Logger

  # For testing
  @spec start() :: :ok
  def start() do
    # Subscribe to progress tracker
    Csv2sql.ProgressTracker.add_subscriber()

    # Trap Exits
    Process.flag(:trap_exit, true)

    # Load configurations
    Csv2sql.Config.Loader.load(%{
      db_type: "mysql",
      db_url: "ecto://user:password@localhost/database",
      log: false,
      source_directory: "/tmp/csvs"
    })

    # Begin analysis
    Task.start(fn ->
      Csv2sql.Stages.Analyze.analyze_files()
    end)

    # Await messages
    receive do
      :finish ->
        IO.puts("Received finish message ")
        :finish

      {:error, err} ->
        IO.puts("Received error message #{inspect(err)}")
        err

      {:EXIT, _pid, reason} ->
        IO.puts("Exited with reason #{inspect(reason)}")
        reason

      msg ->
        IO.puts("Unexpected message received #{inspect(msg)}")
        msg
    end
  end
end

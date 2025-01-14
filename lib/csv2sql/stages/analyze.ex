defmodule Csv2sql.Stages.Analyze do
  use Csv2sql.Types

  alias Csv2sql.{
    TypeDeducer,
    Database,
    DbLoader,
    ProgressTracker,
    Helpers
  }

  @spec analyze_files :: :ok
  def analyze_files do
    try do
      IO.inspect("#{DateTime.utc_now()} analyzing files")
      # Prepare file structs for all csvs in the source directory
      files_list = get_csv_files()

      # Init progress tracker with files list
      ProgressTracker.init_files(files_list)

      # Start Repository
      if Helpers.db_access_required(), do: Database.start_repo()

      # Start Consumer Supervisor
      if Helpers.get_config(:insert_data), do: DbLoader.ConsumerSupervisor.start_link()

      # Remove existing schema file if present
      get_schema_path() |> File.rm()

      files_list
      |> Flow.from_enumerable(
        max_demand: 1,
        # Number of files processed at once
        stages: Helpers.get_config(:worker_count)
      )
      |> Flow.map(&process_file/1)
      |> Flow.run()

      wait_for_finish()
    catch
      _, reason ->
        Csv2sql.ProgressTracker.report_error(reason)
        throw(reason)
    end
  end

  defp wait_for_finish() do
    Csv2sql.ProgressTracker.get_state().status
    |> case do
      :finish ->
        :ok

      {:error, reason} ->
        IO.inspect("Error #{inspect(reason)}")
        :ok

      :imported ->
        Csv2sql.ImportValidator.ImportValidator.validate_import()

        ProgressTracker.check_files_status()
        wait_for_finish()

      _ ->
        ProgressTracker.check_files_status()
        wait_for_finish()
    end
  end

  defp get_csv_files do
    source_directory = Helpers.get_config(:source_directory)

    source_directory
    |> File.ls!()
    |> Enum.filter(&is_csv?/1)
    |> Enum.map(fn file ->
      path = "#{source_directory}#{file}"

      %Csv2sql.File{
        name: String.slice(file, 0..-5//1),
        path: path,
        status: :pending
      }
    end)
  end

  defp process_file(%Csv2sql.File{} = file) do
    try do
      file = %Csv2sql.File{file | status: :analyze}

      # Inform progress tracker, file is being processed
      ProgressTracker.update_file(file)

      # Obtain file schema, row_count and other file stats
      file = get_file_stats(file)

      # Update progress tracker with file data
      ProgressTracker.update_file(file)

      if Helpers.get_config(:insert_schema) do
        drop_query =
          if Helpers.get_config(:drop_existing_tables) do
            ddl_query = Database.get_drop_table_ddl(file.path, Database.get_db_name())

            Database.run_query!(ddl_query)

            ddl_query
          end

        ddl_query =
          Database.get_create_table_ddl(file.path, Database.get_db_name(), file.column_types)

        Database.run_query!(ddl_query)

        query =
          ["\n", drop_query, ddl_query]
          |> Enum.reject(&is_nil/1)
          |> Enum.join("\n")

        File.write(get_schema_path(), query, [:append])
      end

      if Helpers.get_config(:insert_data) do
        # Start a producer for the file
        {:ok, pid} = DbLoader.Producer.start_link(file)

        file = %Csv2sql.File{file | producer_pid: pid}

        ProgressTracker.update_file(file)

        # Subscribe consumers to the producer
        GenStage.sync_subscribe(
          DbLoader.ConsumerSupervisor,
          cancel: :temporary,
          min_demand: 0,
          # Number of consumers loading data in database
          max_demand: Helpers.get_config(:db_worker_count),
          to: pid
        )
      else
        file = %Csv2sql.File{file | status: :done}

        ProgressTracker.update_file(file)
      end
    catch
      _, reason ->
        Csv2sql.ProgressTracker.report_error(reason)
        throw(reason)
    end
  end

  defp get_file_stats(%Csv2sql.File{path: path} = file) do
    if Helpers.get_config(:insert_schema) or Helpers.get_config(:insert_data) do
      %{size: size} = File.stat!(path)
      {row_count, column_types} = TypeDeducer.get_count_and_types(path)

      db_row_count = Database.get_db_row_count_if_exists(path)

      %{
        file
        | size: Sizeable.filesize(size),
          row_count: row_count,
          column_types: column_types,
          existing_db_row_count: db_row_count
      }
    else
      file
    end
  end

  defp is_csv?(filepath) do
    filepath
    |> String.trim()
    |> String.slice(-4..-1)
    |> String.downcase() == ".csv"
  end

  defp get_schema_path(), do: "#{Helpers.get_config(:source_directory)}/schema.sql"
end

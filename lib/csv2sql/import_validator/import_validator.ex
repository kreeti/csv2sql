defmodule Csv2sql.ImportValidator.ImportValidator do
  @moduledoc """
  Validates import by comparing row count in csv vs row count in database
  """

  alias Csv2sql.{Database, Helpers, ProgressTracker}

  def validate_import() do
    file_list = Csv2sql.ProgressTracker.get_state()

    %{stats: {total, correct, incorrect}, incorrect_files: incorrect_files} =
      file_list.files
      |> Map.values()
      |> Flow.from_enumerable()
      |> Flow.map(&Map.put(&1, :validated, validate_csv(&1, &1.row_count)))
      |> Enum.to_list()
      |> Enum.reduce(
        %{stats: {0, 0, 0}, incorrect_files: []},
        fn file, %{stats: {total, correct, incorrect}, incorrect_files: incorrect_files} ->
          result =
            if file.validated do
              %{
                stats: {total + 1, correct + 1, incorrect},
                incorrect_files: incorrect_files
              }
            else
              %{
                stats: {total + 1, correct, incorrect + 1},
                incorrect_files: incorrect_files ++ [file.name]
              }
            end

          result
        end
      )

    update_validation_results(total, correct, incorrect, incorrect_files)
  end

  defp validate_csv(file, row_count) do
    IO.puts("Checking File: #{file.name}")

    db_row_count = Database.get_db_row_count_if_exists(file.path)

    inserted_db_row_count =
      if Helpers.get_config(:drop_existing_tables),
        do: db_row_count,
        else: db_row_count - file.existing_db_row_count

    IO.puts("Count in csv: #{row_count}")
    IO.puts("Count in database:  #{inserted_db_row_count}")

    if row_count == inserted_db_row_count do
      (IO.ANSI.green() <> "Correct !" <> IO.ANSI.reset()) |> IO.puts()

      File.rename(
        file.path,
        Helpers.get_config(:source_directory) <> "/validated/" <> file.name <> ".csv"
      )

      true
    else
      (IO.ANSI.red() <> "Incorrect!" <> IO.ANSI.reset()) |> IO.puts()

      false
    end
  end

  defp update_validation_results(total, correct, incorrect, incorrect_files) do
    """

    #{IO.ANSI.underline()}Validation Completed:#{IO.ANSI.no_underline()}

    """
    |> IO.puts()

    IO.puts("* Number of files checked: #{total}")
    IO.puts("* Number of files with correct count: #{correct}")
    IO.puts("* Number of files with incorrect count: #{incorrect}")

    if total == correct and incorrect_files == [] do
      ProgressTracker.update_validation_status(:passed)
    else
      ProgressTracker.update_validation_status(:failed)

      """


      Files with incorrect count:
      """
      |> IO.puts()

      incorrect_files
      |> Enum.each(fn file ->
        IO.puts("* #{Path.basename(file)}")
      end)
    end

    ProgressTracker.check_files_status()
  end
end

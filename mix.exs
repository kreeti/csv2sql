defmodule Csv2sql.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "4.0.0",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        csv2sql_and_dashboard: [
          applications: [
            csv2sql: :permanent,
            dashboard: :permanent
          ]
        ],
        csv2sql_only: [
          applications: [csv2sql: :permanent]
        ]
      ],
      name: "Csv2sql",
      description: "Csv2Sql is a blazing fast fully automated tool to load huge CSV files into a RDBMS.",
      package: package(),
      source_url: "https://github.com/kreeti/csv2sql"
    ]
  end

  defp package() do
    [
      name: "csv2sql",
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/kreeti/csv2sql"
      }
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:credo, "~> 1.7"},
      {:ex_doc, "~> 0.33.0"}
    ]
  end
end

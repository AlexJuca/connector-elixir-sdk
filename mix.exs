defmodule EnterpriseConnector.MixProject do
  use Mix.Project

  def project do
    [
      app: :enterprise_connector,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      authors: ["Alexandre Juca <corextechnologies@gmail.com>"],
      description: "Simple Elixir library for sending SMS's via Enterprise Connector"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [

      {:httpoison, "~> 1.7"},
      {:poison, "~> 3.1"}
    ]
  end
end

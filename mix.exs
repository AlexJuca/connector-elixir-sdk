defmodule Connector.MixProject do
  use Mix.Project

  def project do
    [
      app: :connector,
      version: "0.1.0",
      elixir: "~> 1.11",
      elixir_rc_paths: elixir_rc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      authors: ["Alexandre Juca <corextechnologies@gmail.com>"],
      description: "Simple Elixir library for sending SMS's via Enterprise Connector"
    ]
  end

  defp elixir_rc_paths(:test), do: ["lib", "test"]
  defp elixir_rc_paths(_), do: ["lib"]

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

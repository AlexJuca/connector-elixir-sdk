defmodule Connector.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :connector,
      version: @version,
      elixir: "~> 1.11",
      elixir_rc_paths: elixir_rc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      description: description(),
      package: package()
    ]
  end

  defp docs do
    [
      extras: ["README.md"],
      main: "readme",
      source_ref: "v#{@version}",
      source_url: "https://github.com/AlexJuca/connector-elixir-sdk"
    ]
  end

  def description do
    "Simple Elixir library for sending SMS's via Enterprise Connector"
  end

  defp package() do
    [
      name: "connector",
      links: %{"Github" => "https://github.com/AlexJuca/connector-elixir-sdk"},
      licenses: ["Apache-2.0"],
      mainteners: ["Alexandre Juca"]
    ]
  end

  defp elixir_rc_paths(:test), do: ["lib", "test"]
  defp elixir_rc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Connector.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.7"},
      {:poison, "~> 3.1"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end

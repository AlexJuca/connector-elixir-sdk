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
      mainteners: ["Alexandre Juca"],
      description: description(),
      package: package()
    ]
  end

  def description do
    "Simple Elixir library for sending SMS's via Enterprise Connector"
  end

  defp package() do
    [
      name: "connector",
      links: %{"Github" => "https://github.com/AlexJuca/connector-elixir-sdk"},
      licenses: ["Apache-2.0"]
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
      {:poison, "~> 3.1"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end

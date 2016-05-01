defmodule ExGit.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_git,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: escript,
     deps: deps]
  end

  def escript do
    [main_module: ExGit.CLI]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:poison, "~> 2.0"}]
  end
end

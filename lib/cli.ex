defmodule ExGit.CLI do
  @commands ["init", "hash-object", "cat-file"]

  def main(args) do
    case args do
      [command | arguments] when command in @commands ->
        execute(command, arguments)
      _ ->
        IO.puts("Usage:\n\tex_git <command> <options>\n#{command_descriptions}")
    end
  end

  defp command_descriptions do
    Enum.map(@commands, fn(x) -> "#{command_description(x)} \n" end)
  end

  defp command_module(command) do
    Module.concat([ExGit, Command, constantize(command)])
  end

  defp command_description(command) do
    "\t\t #{command_module(command).description}"
  end

  defp execute(command, args) do
    command_module(command).execute(args)
  end

  defp constantize(text) do
    text
    |> String.split("-")
    |> Enum.map(fn(x) -> String.capitalize(x) end)
    |> Enum.join
  end

end

defmodule ExGit.CLI do
  @commands ["init"]

  def main(args) do
    case args do
      [command | arguments] when command in @commands ->
        execute(command, arguments)
      _ ->
        IO.puts("Usage:\n\tex_git <command> <options>\n#{command_descriptions}")
    end
  end

  defp command_descriptions do
    Enum.map(@commands, fn(x) -> command_description(x) end)
  end

  defp command_module(command) do
    Module.concat([ExGit, Command, String.capitalize(command)])
  end

  defp command_description(command) do
    "\t\t #{command_module(command).description}"
  end

  defp execute(command, args) do
    command_module(command).execute(args)
  end
end

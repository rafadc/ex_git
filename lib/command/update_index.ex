defmodule ExGit.Command.UpdateIndex do
  @behaviour ExGit.Command

  def description do
    "update-index - Manages what is in the index area"
  end

  def execute(args) do
    {options, argv, _} = OptionParser.parse(args, strict: [add: :boolean, cacheinfo: :boolean])
    update_index(options, argv)
  end

  defp update_index([add: true, cacheinfo: true], argv) do
    IO.puts "Adding to index #{argv} from cacheinfo"
  end

  defp update_index([add: true], argv) do
    IO.puts "Adding to index #{argv}"
  end

  defp update_index([], argv) do
    IO.puts "Updating #{argv}"
  end
end

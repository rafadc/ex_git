defmodule ExGit.Command.CatFile do
  @behaviour ExGit.Command

  def description do
    "cat-file <hash> - Prints the contents of the given hash"
  end

  def execute(args) do
    hash = List.first(args)
    folder = String.slice(hash, 0..1)
    file = String.slice(hash, 2..-1)
    {:ok, contents} = File.read(".exgit/objects/#{folder}/#{file}")
    IO.puts contents
  end
end

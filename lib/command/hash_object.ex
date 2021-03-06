defmodule ExGit.Command.HashObject do
  @behaviour ExGit.Command

  def description do
    "hash-object <file> - Stores the object in the file given"
  end

  def execute(args) do
    {:ok, content} = File.read(List.first(args))
    hash = hash(content)
    folder = String.slice(hash, 0..1)
    file = String.slice(hash, 2..-1)
    File.mkdir(".exgit/objects/#{folder}")
    file_contents = %GitObject{type: "blob", content: content}
                    |> Poison.encode!
    File.write(".exgit/objects/#{folder}/#{file}", file_contents)
  end

  defp hash(content) do
    :crypto.hash(:sha, content)
    |> Base.encode16
    |> String.downcase
  end
end

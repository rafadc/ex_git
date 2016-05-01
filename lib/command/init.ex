defmodule ExGit.Command.Init do
  @behaviour ExGit.Command

  @folders [".exgit/", ".exgit/hooks/", ".exgit/info/", ".exgit/objects/", ".exgit/objects/info", ".exgit/objects/pack", ".exgit/refs/"]

  def description do
    "init - Initialize a Git repository"
  end

  def execute(_args) do
    Enum.each(@folders, fn(folder) -> File.mkdir folder end)
    create_description_file
    IO.puts "Initialized empty ExGit repository in #{System.cwd}"
  end

  defp create_description_file do
    text = "Unnamed repository; edit this file 'description' to name the repository."
    File.write(".exgit/description", text)
  end
end

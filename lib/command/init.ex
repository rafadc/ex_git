defmodule ExGit.Command.Init do
  @behaviour ExGit.Command

  @folders [".git/", ".git/hooks/", ".git/info/", ".git/objects/", ".git/refs/"]

  def description do
    "init - Initialize a Git repository"
  end

  def execute(args) do
    Enum.each(@folders, fn(folder) -> File.mkdir folder end)
    IO.puts "Initialized empty ExGit repository in #{System.cwd}"
  end
end

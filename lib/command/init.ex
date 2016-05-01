defmodule ExGit.Command.Init do
  @behaviour ExGit.Command

  @folders [".git/", ".git/hooks/", ".git/info/", ".git/objects/", ".git/refs/"]

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
    File.write(".git/description", text)
  end
end

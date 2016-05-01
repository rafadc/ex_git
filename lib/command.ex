defmodule ExGit.Command do
  @callback description :: String
  @callback execute() :: String
end

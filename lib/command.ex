defmodule ExGit.Command do
  @callback description :: String
  @callback execute(list(String.t)) :: String
end

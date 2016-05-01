defmodule ExGit.Command do
  @callback description :: String
  @callback execute(any) :: String
end

defmodule GitObject do
  @derive [Poison.Encoder]
  defstruct [:type, :content]
end

defmodule StrongServerTest do
  use ExUnit.Case
  doctest StrongServer

  test "greets the world" do
    assert StrongServer.hello() == :world
  end
end

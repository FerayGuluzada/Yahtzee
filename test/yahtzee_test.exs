defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee

  test "greets the world" do
    assert Yahtzee.hello() == :world
  end
end

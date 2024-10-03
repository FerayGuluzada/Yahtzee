defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee


  test "Identify 'Three of a kind' with three 4s" do
    assert %{"Three of a kind": 17} = Yahtzee.score_lower([2, 3, 4, 4, 4])
  end

  test "Identify 'Three of a kind' with four 4s" do
    assert %{"Three of a kind": 18} = Yahtzee.score_lower([2, 4, 4, 4, 4])
  end

  test "Identify 'Three of a kind' with five 5s" do
    assert %{"Three of a kind": 25} = Yahtzee.score_lower([5, 5, 5, 5, 5])
  end

  test "No 'Three of a kind' with negative number" do
    assert %{"Three of a kind": 0} = Yahtzee.score_lower([-1, 2, 3, 4, 5])
  end

  test "No 'Three of a kind' with zero" do
    assert %{"Three of a kind": 0} = Yahtzee.score_lower([0, 2, 6, 3, 2])
  end


end

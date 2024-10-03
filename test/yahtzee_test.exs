defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee


  #Three of a kind

  test "Identify 'Three of a kind' with three 4s" do
    assert %{"Three of a kind": 17} = Yahtzee.score_lower([2, 3, 4, 4, 4])
  end

  test "Identify 'Three of a kind' with four 4s" do
    assert %{"Three of a kind": 18} = Yahtzee.score_lower([2, 4, 4, 4, 4])
  end

  test "Identify 'Three of a kind' with five 5s" do
    assert %{"Three of a kind": 25} = Yahtzee.score_lower([5, 5, 5, 5, 5])
  end




  #Four of a kind

  test "Identify 'Four of a kind' with every face" do
    assert %{"Four of a kind": 24} = Yahtzee.score_lower([4, 5, 5, 5, 5])
  end

  test "Identify 'Four of a kind' with five 5s" do
    assert %{"Four of a kind": 25} = Yahtzee.score_lower([5, 5, 5, 5, 5])
  end






end

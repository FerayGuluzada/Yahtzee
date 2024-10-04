defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee


  test "Identify 'Three of a kind' with ones" do
    assert %{"Three of a kind" => 17} = Yahtzee.score_lower([2, 3, 4, 4, 4])
  end


  test "Three of a kind with various combinations" do
    assert %{"Three of a kind" => 17} = Yahtzee.score_lower([4, 4, 4, 3, 2])
    assert %{"Three of a kind" => 0} = Yahtzee.score_lower([5, 5, 5, 5, 1]) #What if we have 3+?
    assert %{"Three of a kind" => 0} = Yahtzee.score_lower([1, 2, 3, 4, 5]) # No three of a kind
  end


  test "Identify 'Four of a kind' with every face" do
    assert %{"Four of a kind" => 24} = Yahtzee.score_lower([4, 5, 5, 5, 5])
  end

  test "Four of a kind with various combinations" do
    assert %{"Four of a kind" => 0} = Yahtzee.score_lower([6, 6, 6, 6, 6]) #What if we have 4+?
    assert %{"Four of a kind" => 0} = Yahtzee.score_lower([1, 2, 3, 4, 5]) # No four of a kind
  end

  test "Identify 'Full house' with every face" do
    assert %{"Full house" => 25} = Yahtzee.score_lower([2, 2, 5, 5, 5])
  end

  test "Full house with various combinations" do
    assert %{"Full house" => 25} = Yahtzee.score_lower([3, 3, 4, 4, 4])
    assert %{"Full house" => 0} = Yahtzee.score_lower([1, 1, 2, 2, 3]) # No full house
    assert %{"Full house" => 0} = Yahtzee.score_lower([1, 3, 2, 2, 2]) # No full house
  end











end

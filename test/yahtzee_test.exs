defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee


  test "Identify 'Three of a kind' with ones" do
    assert %{"Three of a kind": 17} = Yahtzee.score_lower([2, 3, 4, 4, 4])
  end


  test "Three of a kind with various combinations" do
    assert %{"Three of a kind": 17} = Yahtzee.score_lower([4, 4, 4, 3, 2])
    assert %{"Three of a kind": 0} = Yahtzee.score_lower([5, 5, 5, 5, 1]) #What if we have 3+?
    assert %{"Three of a kind": 0} = Yahtzee.score_lower([1, 2, 3, 4, 5]) # No three of a kind
  end




  test "Identify 'Four of a kind' with every face" do
    assert %{"Four of a kind": 24} = Yahtzee.score_lower([4, 5, 5, 5, 5])
  end

  test "Four of a kind with various combinations" do
    assert %{"Four of a kind": 0} = Yahtzee.score_lower([6, 6, 6, 6, 6]) #What if we have 4+?
    assert %{"Four of a kind": 0} = Yahtzee.score_lower([1, 2, 3, 4, 5]) # No four of a kind
  end




  test "Identify 'Full house' with every face" do
    assert %{"Full house": 25} = Yahtzee.score_lower([2, 2, 5, 5, 5])
  end

  test "Full house with various combinations" do
    assert %{"Full house": 25} = Yahtzee.score_lower([3, 3, 4, 4, 4])
    assert %{"Full house": 0} = Yahtzee.score_lower([1, 1, 2, 2, 3]) # No full house
    assert %{"Full house": 0} = Yahtzee.score_lower([1, 3, 2, 2, 2]) # No full house
  end




  test "Identify 'Large Straight'" do
    assert %{"Large Straight": 40} = Yahtzee.score_lower([2, 3, 4, 5, 6])
    assert %{"Large Straight": 40} = Yahtzee.score_lower([2, 3, 5, 4, 6]) # Consecutive numbers in the wrong order
    assert %{"Large Straight": 0} = Yahtzee.score_lower([1, 3, 4, 5, 6]) # No Large Straight
    assert %{"Large Straight": 0} = Yahtzee.score_lower([2, 2, 2, 5, 6]) # Make sure others are working
  end



  test "Identify 'Small Straight'" do
    assert %{"Small Straight": 30} = Yahtzee.score_lower([2, 3, 2, 5, 4])
    assert %{"Small Straight": 30} = Yahtzee.score_lower([2, 3, 3, 4, 5])
    assert %{"Large Straight": 40} = Yahtzee.score_lower([1, 2, 3, 4, 5]) # Make sure Large Straight has the priority
    assert %{"Three of a kind": 15} = Yahtzee.score_lower([2, 2, 2, 4, 5]) # Make sure others work

  end


  test "Identify 'Yahtzee'" do
    assert %{Yahtzee: 50} = Yahtzee.score_lower([2, 2, 2, 2, 2])
    assert %{Yahtzee: 0} = Yahtzee.score_lower([2, 2, 2, 2, 1]) #No Yahtzee
    assert %{Yahtzee: 0} = Yahtzee.score_lower([1, 2, 3, 4, 5]) #No Yahtzee
    assert %{"Large Straight": 40} = Yahtzee.score_lower([2, 3, 4, 5, 1]) #Make sure others are working
  end


  test "Identify any other combination" do
    assert %{Chance: 10} = Yahtzee.score_lower([1, 1, 2, 2, 4])
    assert %{Chance: 0} = Yahtzee.score_lower([1, 1, 2, 2, 2])
    assert %{Chance: 0} = Yahtzee.score_lower([1, 2, 3, 4, 5])
  end


  test "Total score with two rounds, using different categories" do
    assert Yahtzee.total_score([[2, 3, 4, 4, 4], [6, 6, 6, 5, 5]]) == 42
  end


  test "Total score with three rounds, using different categories" do
    assert Yahtzee.total_score([[1, 2, 3, 4, 5], [2, 2, 2, 3, 4], [4, 4, 4, 4, 4]]) == 40 + 13 + 50
  end

  test "Total score with Large Straight first, and Small Straight second" do
    assert Yahtzee.total_score([[1, 2, 3, 4, 5], [1, 2, 3, 4, 5]]) == 40 + 30
  end

  test "Total score with Full House first, and Three of a Kind second" do
    assert Yahtzee.total_score([[2, 2, 3, 3, 3], [3, 3, 2, 2, 2]]) == 25 + 12
  end

  test "Total score with Chance and Four of a Kind" do
    assert Yahtzee.total_score([[1, 1, 2, 2, 4], [3, 3, 3, 3, 2]]) == 10 + 14
  end






end

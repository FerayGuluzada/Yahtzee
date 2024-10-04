defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee


  #Three of a kind

  #positive

  test "Identify 'Three of a kind' with three 4s" do
    assert %{"Three of a kind": 17} = Yahtzee.score_lower([2, 3, 4, 4, 4])
  end

  #negative

  test "Identify No 'Three of a kind' with no same faces" do
    assert %{"Three of a kind": 0} = Yahtzee.score_lower([1, 2, 3, 4, 5])
  end

  test "Identify No 'Three of a kind' with less than 3 same faces" do
    assert %{"Three of a kind": 0} = Yahtzee.score_lower([5, 5, 1, 2, 3])
  end

  test "Identify No 'Three of a kind' with four 4s" do
    assert %{"Three of a kind": 0} = Yahtzee.score_lower([2, 4, 4, 4, 4])
  end

  test "Identify No 'Three of a kind' with five 5s" do
    assert %{"Three of a kind": 0} = Yahtzee.score_lower([5, 5, 5, 5, 5])
  end




  #Four of a kind

  #positive
  test "Identify 'Four of a kind' with every face" do
    assert %{"Four of a kind": 24} = Yahtzee.score_lower([4, 5, 5, 5, 5])
  end


  #negative

  test "Identify No 'Four of a kind' with no same faces" do
    assert %{"Four of a kind": 0} = Yahtzee.score_lower([1, 2, 3, 4, 5])
  end

  test "Identify No 'Four of a kind' with less than 4 same faces" do
    assert %{"Four of a kind": 0} = Yahtzee.score_lower([5, 5, 1, 2, 3])
  end

  test "Identify No 'Four of a kind' with five 5s" do
    assert %{"Four of a kind": 0} = Yahtzee.score_lower([5, 5, 5, 5, 5])
  end


  # # Full House

  # #positive
  # test "Identify 'Full house' with every face" do
  #   assert %{"Full house": 25} = Yahtzee.score_lower([2, 2, 5, 5, 5])
  # end

  # #negative
  # test "Identify No 'Full house' with 3 same 2 different faces" do
  #   assert %{"Full house": 0} = Yahtzee.score_lower([2, 1, 5, 5, 5])
  # end








end

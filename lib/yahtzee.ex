defmodule Yahtzee do
  def score_lower(dice) do
    score = %{
      "Small Straight": calculate_small_straight(dice),
      "Large Straight": calculate_large_straight(dice),
      "Full house": calculate_full_house_score(dice),
      "Three of a kind": calculate_three_of_a_kind_score(dice),
      "Four of a kind": calculate_four_of_a_kind_score(dice)
    }
    # Return the final score directly
    score
  end

  defp calculate_three_of_a_kind_score(dice) do
    counts = Enum.frequencies(dice)

    # Check for exactly three of a kind and ensure there are no additional matches
    if Map.values(counts) |> Enum.member?(3) and Map.values(counts) |> Enum.all?(&(&1 <= 3)) do
      Enum.sum(dice)
    else
      0
    end
  end

  defp calculate_four_of_a_kind_score(dice) do
    counts = Enum.frequencies(dice)

    # Check for exactly four of a kind and ensure there are no additional matches
    if Map.values(counts) |> Enum.member?(4) and Map.values(counts) |> Enum.all?(&(&1 <= 4)) do
      Enum.sum(dice)
    else
      0
    end
  end

  defp calculate_full_house_score(dice) do
    counts = Enum.frequencies(dice)
    has_three = Enum.any?(counts, fn {_number, count} -> count == 3 end)
    has_two = Enum.any?(counts, fn {_number, count} -> count == 2 end)

    # Return 25 for full house if conditions are met
    if has_three and has_two, do: 25, else: 0
  end

  defp calculate_large_straight(dice) do
    unique_dice = Enum.uniq(dice)

    # Define the valid large straights as sets
    valid_straights = [MapSet.new([1, 2, 3, 4, 5]), MapSet.new([2, 3, 4, 5, 6])]

    # Check if the unique dice match any of the valid straights
    if Enum.any?(valid_straights, &(&1 == MapSet.new(unique_dice))) do
      40
    else
      0
    end
  end

  defp calculate_small_straight(dice) do
    unique_dice = Enum.uniq(dice)

    # Define the valid small straights as sets
    valid_straights = [
      MapSet.new([1, 2, 3, 4]),
      MapSet.new([2, 3, 4, 5]),
      MapSet.new([3, 4, 5, 6])
    ]

    # Check if the unique dice match any of the valid small straights
    if Enum.any?(valid_straights, &(&1 |> MapSet.subset?(MapSet.new(unique_dice)))) do
      30  # Return 30 points for a small straight
    else
      0
    end
  end

end

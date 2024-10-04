defmodule Yahtzee do
  def score_lower(dice) do
    score = %{
      "Three of a kind": calculate_three_of_a_kind_score(dice),
      "Four of a kind": calculate_four_of_a_kind_score(dice),
      "Full house": calculate_full_house_score(dice),
      "Small Straight": calculate_small_straight(dice),
      "Large Straight": calculate_large_straight(dice),
      "Yahtzee": calculate_yahtzee(dice),
      "Chance": calculate_chance(dice)
    }

    # Keep only the categories with non-zero scores, others should be zero
    Enum.map(score, fn {key, value} ->
      if value > 0, do: {key, value}, else: {key, 0}
    end) |> Enum.into(%{})
  end

  defp calculate_three_of_a_kind_score(dice) do
    counts = Enum.frequencies(dice)
    if Map.values(counts) |> Enum.member?(3), do: Enum.sum(dice), else: 0
  end

  defp calculate_four_of_a_kind_score(dice) do
    counts = Enum.frequencies(dice)
    if Map.values(counts) |> Enum.member?(4), do: Enum.sum(dice), else: 0
  end

  defp calculate_full_house_score(dice) do
    counts = Enum.frequencies(dice)
    has_three = Enum.any?(counts, fn {_number, count} -> count == 3 end)
    has_two = Enum.any?(counts, fn {_number, count} -> count == 2 end)
    if has_three and has_two, do: 25, else: 0
  end

  defp calculate_large_straight(dice) do
    unique_dice = Enum.uniq(dice)
    valid_straights = [MapSet.new([1, 2, 3, 4, 5]), MapSet.new([2, 3, 4, 5, 6])]
    if Enum.any?(valid_straights, &(&1 == MapSet.new(unique_dice))), do: 40, else: 0
  end

  defp calculate_small_straight(dice) do
    unique_dice = Enum.uniq(dice)
    valid_straights = [
      MapSet.new([1, 2, 3, 4]),
      MapSet.new([2, 3, 4, 5]),
      MapSet.new([3, 4, 5, 6])
    ]
    if Enum.any?(valid_straights, &MapSet.subset?(&1, MapSet.new(unique_dice))), do: 30, else: 0
  end

  defp calculate_yahtzee(dice) do
    counts = Enum.frequencies(dice)
    if Map.values(counts) |> Enum.member?(5), do: 50, else: 0
  end

  defp calculate_chance(dice) do
    # Check for matches
    has_match =
      calculate_three_of_a_kind_score(dice) > 0 or
      calculate_four_of_a_kind_score(dice) > 0 or
      calculate_full_house_score(dice) > 0 or
      calculate_large_straight(dice) > 0 or
      calculate_small_straight(dice) > 0 or
      calculate_yahtzee(dice) > 0

    # If there are no matches, return 10; otherwise return 0
    if has_match, do: 0, else: 10
  end

  def total_score(dice_rounds) do
    categories = [
      "Three of a kind",
      "Four of a kind",
      "Full house",
      "Small Straight",
      "Large Straight",
      "Yahtzee",
      "Chance"
    ]

    # Make an empty set to track used categories
    used_categories = MapSet.new()

    # Iterate over each round of dice and calculate scores
    Enum.reduce(dice_rounds, 0, fn dice, total ->
      round_scores = score_lower(dice)

      # Get the highest scoring category that hasn't been used yet
      {best_category, best_score} =
        round_scores
        |> Enum.filter(fn {category, _score} -> not MapSet.member?(used_categories, category) end)
        |> Enum.max_by(fn {_category, score} -> score end, fn -> {"None", 0} end)

      # Update the used categories set
      used_categories = MapSet.put(used_categories, best_category)

      # Add the best score to total
      total + best_score
    end)
  end
end

defmodule Yahtzee do
  def score_lower(dice) do
    score = %{
      "Full house" => calculate_full_house_score(dice),
      "Three of a kind" => calculate_three_of_a_kind_score(dice),
      "Four of a kind" => calculate_four_of_a_kind_score(dice)
    }
    Enum.into(score, %{"Three of a kind" => 0, "Four of a kind" => 0})
  end

  defp calculate_three_of_a_kind_score(dice) do
    counts = Enum.frequencies(dice)

    # Check for exactly three of a kind
    if Map.values(counts) |> Enum.member?(3) and Map.values(counts) |> Enum.all?(&(&1 <= 3)) do
      Enum.sum(dice)
    else
      0
    end
  end

  defp calculate_four_of_a_kind_score(dice) do
    counts = Enum.frequencies(dice)

    # Check for exactly four of a kind
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
    if has_three and has_two, do: 25, else: 0
  end

  # defp find_n_of_a_kind(dice, n) do
  #   dice
  #   |> Enum.frequencies()
  #   |> Enum.any?(fn {_number, count} -> count >= n end)
  # end
end

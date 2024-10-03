defmodule Yahtzee do
  def score_lower(dice) when is_list(dice) do
    # Check if all numbers are positive
    if Enum.all?(dice, &(&1 > 0)) do
      counts = count_faces(dice)

      # Check for "Three of a kind"
      case Enum.find(counts, fn {_face, count} -> count >= 3 end) do
        {_face, _count} ->
          # Sum of faces for score
          score = Enum.sum(dice)
          %{:"Three of a kind" => score}

        _ ->
          %{:"Three of a kind" => 0}
      end
    else
      %{:"Three of a kind" => 0}  # Return 0 if any dice are not positive
    end
  end

  defp count_faces(dice) do
    # Count the occurrences of each face
    Enum.frequencies(dice)
  end
end

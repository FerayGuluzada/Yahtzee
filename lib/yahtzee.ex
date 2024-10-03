defmodule Yahtzee do
  def score_lower(dice) do
    # Count occurrences of each die face
    counts = count_faces(dice)

    # THREE OF A KIND
    three_of_a_kind_score =
      case Enum.find(counts, fn {_face, count} -> count >= 3 end) do
        {_face, _count} ->
          # Sum of faces for score
          Enum.sum(dice)

        _ ->
          0
      end

    # FOUR OF A KIND
    four_of_a_kind_score =
      case Enum.find(counts, fn {_face, count} -> count >= 4 end) do
        {_face, _count} ->
          # Sum of faces for score
          Enum.sum(dice)

        _ ->
          0
      end

    %{
      :"Three of a kind" => three_of_a_kind_score,
      :"Four of a kind" => four_of_a_kind_score
    }
  end

  defp count_faces(dice) do
    # Count the occurrences of each face
    Enum.frequencies(dice)
  end
end

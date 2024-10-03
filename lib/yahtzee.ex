defmodule Yahtzee do
  def score_lower(dice) do

    # Count occurrences of each die face
    counts = count_faces(dice)
    
      #THREE OF A KIND
      case Enum.find(counts, fn {_face, count} -> count >= 3 end) do
        {_face, _count} ->
          # Sum of faces for score
          score = Enum.sum(dice)
          %{:"Three of a kind" => score}

        _ ->
          %{:"Three of a kind" => 0}
      end
  end

  defp count_faces(dice) do
    # Count the occurrences of each face
    Enum.frequencies(dice)
  end
end

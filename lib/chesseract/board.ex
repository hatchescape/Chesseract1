defmodule Chesseract.Board do
  defstruct positions: []

  @height [1, 2]
  @width [1, 2]
  @ranks [1, 2, 3, 4, 5, 6, 7, 8]
  @files [1, 2, 3, 4, 5, 6, 7, 8]

  def new() do
    positions =
      do_row()
      |> List.flatten()
      |> Enum.map(fn {height, width, ranks, files} ->
        create_piece_for_position(height, width, ranks, files)
      end)
      |> Enum.reverse()

     %Chesseract.Board{positions: positions}

  #  %__MODULE__{positions: positions}
  end

  defp do_row(), do: Enum.reduce(@ranks, [], fn ranks, acc -> [do_row(ranks) | acc] end)

  defp do_row(ranks),
    do: Enum.reduce(@files, [], fn files, acc -> [do_row(files, ranks) | acc] end)

  defp do_row(files, ranks),
    do: Enum.reduce(@width, [], fn width, acc -> [do_row(files, width, ranks) | acc] end)

  defp do_row(files, width, ranks),
    do: Enum.reduce(@height, [], fn height, acc -> [{height, width, ranks, files} | acc] end)

  defp create_piece_for_position(height, width, ranks, files) do
    piece = set_piece(height, width, ranks, files)

    {
      :"H#{height},W#{width},R#{ranks},F#{files}",
      piece
    }
  end

  defp set_piece(height, width, ranks, files) do
    cond do
      ranks in [1] and files in [1, 8] and height in [1] and width in [1] -> "R"
      ranks in [8] and files in [1, 8] and height in [2] and width in [2] -> "r"
      ranks in [1] and files in [2, 7] and height in [1] and width in [1] -> "N"
      ranks in [8] and files in [2, 7] and height in [2] and width in [2] -> "n"
      ranks in [1] and files in [3, 6] and height in [1] and width in [1] -> "B"
      ranks in [8] and files in [3, 6] and height in [2] and width in [2] -> "b"
      ranks in [1] and files in [4] and height in [1] and width in [1] -> "K"
      ranks in [8] and files in [4] and height in [2] and width in [2] -> "k"
      ranks in [1] and files in [5] and height in [1] and width in [1] -> "Q"
      ranks in [8] and files in [5] and height in [2] and width in [2] -> "q"
      ranks in [2] and height in [1] and width in [1] -> "P"
      ranks in [7] and height in [2] and width in [2] -> "p"
      true -> nil
    end
  end

end

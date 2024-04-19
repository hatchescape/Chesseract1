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

    select_coordinates(%Chesseract.Board{positions: positions})

  #  %__MODULE__{positions: positions}
  end

  defp do_row(), do: Enum.reduce(@ranks, [], fn ranks, acc -> [do_row(ranks) | acc] end)

  defp do_row(ranks),
    do: Enum.reduce(@files, [], fn files, acc -> [do_row(files, ranks) | acc] end)

  defp do_row(files, ranks),
    do: Enum.reduce(@width, [], fn width, acc -> [do_row(files, width, ranks) | acc] end)

  defp do_row(files, width, ranks),
    do: Enum.reduce(@height, [], fn height, acc -> [{height, width, ranks, files} | acc] end)

  def create_piece_for_position(height, width, ranks, files) do
    piece = set_piece(height, width, ranks, files)

    {
      :"H#{height},W#{width},R#{ranks},F#{files}",
      piece
    }
  end

  # Pattern match to determine what type of object should be returned based on the
  # files and ranks
  def set_piece(height, width, ranks, files) do
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

  def select_coordinates(%Chesseract.Board{positions: positions}) do
    [lheight, lwidth, lranks, lfiles] =
      IO.gets("Please enter coordinates in the format H,W,R,F:")
      |> String.trim()
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    test =
      Enum.filter(positions, fn {key, _value} ->
        key == :"H#{lheight},W#{lwidth},R#{lranks},F#{lfiles}"
      end)

    IO.inspect(test)

    case test do
      [{_, "r"}] ->
        brmoves(lheight, lwidth, lranks, lfiles)

      [{_, "R"}] ->
        wrmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "n"}] ->
        bnmoves(lheight, lwidth, lranks, lfiles)

      [{_, "N"}] ->
        wnmoves(lheight, lwidth, lranks, lfiles)

      [{_, "b"}] ->
        bbmoves(lheight, lwidth, lranks, lfiles)

      [{_, "B"}] ->
        wbmoves(lheight, lwidth, lranks, lfiles)

      [{_, "k"}] ->
        bkmoves(lheight, lwidth, lranks, lfiles)

      [{_, "K"}] ->
        wkmoves(lheight, lwidth, lranks, lfiles)

      [{_, "q"}] ->
        bqmoves(lheight, lwidth, lranks, lfiles)

      [{_, "Q"}] ->
        wqmoves(lheight, lwidth, lranks, lfiles)

      [{_, "p"}] ->
        bpmoves(lheight, lwidth, lranks, lfiles)

      [{_, "P"}] ->
        wpmoves(lheight, lwidth, lranks, lfiles)

      result ->
        IO.inspect(result)
        IO.puts("No piece found at the specified coordinates.")
    end
  end

  def brmoves(lheight, lwidth, lranks, lfiles) do
    IO.puts("there's a black rook here!")

    for height <- 1..2,
        lheight != height,
        do: IO.puts("{#{height}, #{lwidth}, #{lranks}, #{lfiles}}")

    for width <- 1..2,
        lwidth != width,
        do: IO.puts("{#{lheight}, #{width}, #{lranks}, #{lfiles}}")

    for ranks <- 1..8,
        lranks != ranks,
        do: IO.puts("{#{lheight}, #{lwidth}, #{ranks}, #{lfiles}}")

    for files <- 1..8,
        lfiles != files,
        do: IO.puts("{#{lheight}, #{lwidth}, #{lranks}, #{files}}")
  end

  def wrmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    IO.puts("there's a white rook here!")
    height_moves = for height <- 1..2, lheight != height, do: {height, lwidth, lranks, lfiles}
    width_moves = for width <- 1..2, lwidth != width, do: {lheight, width, lranks, lfiles}
    rank_moves = for ranks <- 1..8, lranks != ranks, do: {lheight, lwidth, ranks, lfiles}
    file_moves = for files <- 1..8, lfiles != files, do: {lheight, lwidth, lranks, files}

    height_moves ++ width_moves ++ rank_moves ++ file_moves
   # |> IO.inspect()
    |> Enum.each(&weak_inspect_coord(%Chesseract.Board{positions: positions}, &1))
   # |> Enum.each(&is_piece?(%Chesseract.Board{positions: positions}, &1))
  end


  def weak_inspect_coord(%Chesseract.Board{positions: positions}, input) do
    IO.puts("weak_inspect_coord started")
    {lheight, lwidth, lranks, lfiles} = input

    test =
      Enum.filter(positions, fn {key, _value} ->
        key == :"H#{lheight},W#{lwidth},R#{lranks},F#{lfiles}"
      end)

   # IO.inspect(test)
    |> Enum.filter(fn pass -> is_piece?(%Chesseract.Board{positions: positions}, pass) end)
    |> Enum.each(&is_piece?(%Chesseract.Board{positions: positions}, &1))
    |> IO.inspect()
  end

  def is_piece?(%Chesseract.Board{positions: positions}, input) do
    IO.puts("is_piece started")
    test =
      thing = Tuple.to_list(input)
       if List.last(thing) == nil do
        :thisIsNil
       else
       Enum.filter(thing, &is_integer/1)
       |> Enum.map(&add_stuff(%Chesseract.Board{positions: positions}, &1))
       end
  #  IO.inspect(test)
  end


  def add_stuff(%Chesseract.Board{positions: positions}, input) do
    IO.puts("add_stuff started")

   test =
    x = [1.. 7]
    weaker_inspect_coord(%Chesseract.Board{positions: positions}, (input + x))
    weaker_inspect_coord(%Chesseract.Board{positions: positions}, (input - x))
  IO.inspect(test)
  end

  def weaker_inspect_coord(%Chesseract.Board{positions: positions}, input) do
    IO.puts("weaker_inspect_coord started")
    {lheight, lwidth, lranks, lfiles} = input

    test =
      Enum.filter(positions, fn {key, _value} ->
        key == :"H#{lheight},W#{lwidth},R#{lranks},F#{lfiles}"
      end)

  #  IO.inspect(test)
    |> Enum.filter(fn pass -> lesser_is_piece?(%Chesseract.Board{positions: positions}, pass) end)
  end

  def lesser_is_piece?(%Chesseract.Board{positions: positions}, input) do
    IO.puts("is_piece started")
    test =
      thing = Tuple.to_list(input)
       if List.last(thing) == nil do
        :thisIsNil
       else
       Enum.filter(thing, &is_integer/1)
       end
  #  IO.inspect(test)
  end

  def bnmoves(lheight, lwidth, lranks, lfiles) do
    IO.puts("there's a black knight here!")
  end

  def wnmoves(lheight, lwidth, lranks, lfiles) do
    IO.puts("there's a white knight here!")
  end

  def bbmoves(lheight, lwidth, lranks, lfiles) do
    IO.puts("there's a black bishop here!")
  end

  def wbmoves(lheight, lwidth, lranks, lfiles) do
    IO.puts("there's a white bishop here!")
  end

  def bkmoves(lheight, lwidth, lranks, lfiles) do
    IO.puts("there's a black king here!")
  end

  def wkmoves(lheight, lwidth, lranks, lfiles) do
    IO.puts("there's a white king here!")
  end

  def bqmoves(lheight, lwidth, lranks, lfiles) do
    IO.puts("there's a black queen here!")
  end

  def wqmoves(lheight, lwidth, lranks, lfiles) do
    IO.puts("there's a white queen here!")
  end

  def bpmoves(lheight, lwidth, lranks, lfiles) do
    IO.puts("there's a black pawn here!")
  end

  def wpmoves(lheight, lwidth, lranks, lfiles) do
    IO.puts("there's a white pawn here!")
  end
end





  # case Enum.(@height[lheight], @width[lwidth], @files[lfiles], @ranks[lranks]) do
  #   nil ->
  #     IO.puts "No piece found at the specified coordinates."
  #   else ->
  #     IO.puts "Piece found: #{Enum.find_value(@height[lheight], @width[lwidth], @files[lfiles], @ranks[lranks])}"
  #     case Enum.find_value(@height[lheight], @width[lwidth], @files[lfiles], @ranks[lranks]) == "R" do
  #       for height <- 1..2, lheight != height, do: IO.puts "{#{height}, #{width}, #{ranks}, #{files}}"
  #       for width <- 1..2, lwidth != width, do: IO.puts "{#{height}, #{width}, #{ranks}, #{files}}"
  #       for ranks <- 1..8, lranks != ranks, do: IO.puts "{#{height}, #{width}, #{ranks}, #{files}}"
  #       for files <- 1..8, lfiles != files, do: IO.puts "{#{height}, #{width}, #{ranks}, #{files}}"
  #     end
  # end

# Enum.filter(Board.positions, fn {key,_value} -> key == {lheight,lwidth,lranks,lfiles} end)
# Keyword.values(Board.positions) |> Enum.at(0)

# end
# coordinates =
# {height, width, files, ranks}
# |> Enum.find(piece)

# game
# def make_move(from, to, %Chesseract.Board{positions}) do
# new_position = lookup_position(to)
#  case get_list_of_positions(current_position) do

# end
#    Board.update_position(current, new)
# end

#
# def piece_at(coordinates) do
# Enum.find(piece)
# end

# end

# Enum.filter(board.positions, fn {key,value} -> key == :"H1,W1,R1,F2" end)
# Enum.filter(board.positions, fn {key,value} -> key == :"H1,W1,R1,F2" end) |> Enum.at(1)
# Enum.filter(board.positions, fn {key,value} -> key == :"H1,W1,R1,F2" end)

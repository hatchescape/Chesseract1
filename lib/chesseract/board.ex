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

  def select_coordinates(%Chesseract.Board{positions: positions}) do #divide into white turn and black turn
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
        brmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "R"}] ->
        wrmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "n"}] ->
        bnmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "N"}] ->
        wnmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "b"}] ->
        bbmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "B"}] ->
        wbmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "k"}] ->
        bkmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "K"}] ->
        wkmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "q"}] ->
        bqmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "Q"}] ->
        wqmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "p"}] ->
        bpmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "P"}] ->
        wpmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      result ->
        IO.inspect(result)
        IO.puts("No piece found at the specified coordinates.")
    end
  end

  def brmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
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
    |> Enum.map(&find_coord(%Chesseract.Board{positions: positions}, &1))
    |> List.flatten() #here are all rook moves from coord with pieces, should proabably trim further to exclude player pieces
    |> Enum.map(&trim_coord(&1))
    |> Enum.map(&rook_stuff(%Chesseract.Board{positions: positions}, &1, lheight, lwidth, lranks, lfiles)) #returns list of all invalid passed-piece rook moves, if I invert it will it return only valid? No, because of overlap, shit. Oh well.
  end


  defp find_coord(%Chesseract.Board{positions: positions}, input) do
   # IO.puts("weak_inspect_coord started")
    {lheight, lwidth, lranks, lfiles} = input

    test =
      Enum.filter(positions, fn {key, value} ->
        key == :"H#{lheight},W#{lwidth},R#{lranks},F#{lfiles}" and value != nil
      end)
    test
  end

  def trim_coord(input) do
    IO.puts("trim_coord started")
    IO.inspect(input)

    pass = to_string(elem(input, 0))
    split_input = String.split(pass, ",")
    integers = Enum.map(split_input, fn str ->
      str
      |> String.replace(~r/\D/, "")
      |> String.to_integer()
    end)

    integers
  end


  def rook_stuff(%Chesseract.Board{positions: positions}, input, lheight, lwidth, lranks, lfiles) do
    IO.puts("rook_stuff started")
    range = 1..7
    first = Enum.at(input, 0)
    second = Enum.at(input, 1)
    third = Enum.at(input, 2)
    fourth = Enum.at(input, 3)
    list = [first, second, third, fourth]
    IO.puts("#{list}")

    part1 = cond do
      first > lheight ->
        Enum.map(range, fn r -> first + r end)
      first < lheight ->
        Enum.map(range, fn r -> first - r end)
      true ->
        nil
    end
    part2 = cond do
      second > lwidth ->
        Enum.map(range, fn r -> second + r end)
      second < lwidth ->
        Enum.map(range, fn r -> second - r end)
      true ->
        nil
    end
    part3 = cond do
      third > lranks ->
        Enum.map(range, fn r -> third + r end)
      third < lranks ->
        Enum.map(range, fn r -> third - r end)
      true ->
        nil
    end
    part4 = cond do
      fourth > lfiles ->
        Enum.map(range, fn r -> fourth + r end)
      fourth < lfiles ->
        Enum.map(range, fn r -> fourth - r end)
      true ->
        nil
    end
    IO.inspect(part1)
    IO.inspect(part2)
    IO.inspect(part3)
    IO.inspect(part4)
    if part1 !== nil do
      Enum.map(part1, fn x -> [x] ++ [second] ++ [third] ++ [fourth] end) end
    if part2 !== nil do
      Enum.map(part2, fn x -> [first] ++ [x] ++ [third] ++ [fourth] end) end
    if part3 !== nil do
      Enum.map(part3, fn x -> [first] ++ [second] ++ [x] ++ [fourth] end) end
    if part4 !== nil do
      Enum.map(part4, fn x -> [first] ++ [second] ++ [third] ++ [x] end) end
    end

    # Enum.map(range, fn r -> Enum.at(part1, r) ++ Enum.at(part2, r) ++ Enum.at(part3, r) ++ Enum.at(part4, r) end)
    # |> IO.inspect()

    # |> Enum.map(fn elem ->
    #   IO.inspect elem
      # loop through the range and create a new list
   # end)


  def bnmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    IO.puts("there's a black knight here!")
  end

  def wnmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    IO.puts("there's a white knight here!")
  end

  def bbmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    IO.puts("there's a black bishop here!")
  end

  def wbmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    IO.puts("there's a white bishop here!")
  end

  def bkmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    IO.puts("there's a black king here!")
  end

  def wkmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    IO.puts("there's a white king here!")
  end

  def bqmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    IO.puts("there's a black queen here!")
  end

  def wqmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    IO.puts("there's a white queen here!")
  end

  def bpmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    IO.puts("there's a black pawn here!")
  end

  def wpmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
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

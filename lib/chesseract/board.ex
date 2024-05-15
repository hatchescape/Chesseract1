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

    h_up = Enum.take_while((case lheight do
      1 -> 2
      2 -> 2
      end)..2, fn h ->
      case find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    h_down = Enum.take_while((case lheight do
      1 -> 1
      2 -> 1
      end)..1, fn h ->
      case find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)
    #                                                                           \/ might need to compile a map here from enum.filter, or else enum.at will just run multiple times for each value intead of returning the first of the set. Maybe not though, might be fine.
    h_first = (case find_coord(%Chesseract.Board{positions: positions}, {Enum.at(Enum.filter((case lheight do
      1 -> 2
      2 -> 2
      end)..2, fn h ->
      case find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
        [{_, nil}] -> false
        _ -> true
      end
    end), 0), lwidth, lranks, lfiles}) do
      [{_, "r"}] -> lheight
      [{_, "n"}] -> lheight
      [{_, "b"}] -> lheight
      [{_, "k"}] -> lheight
      [{_, "q"}] -> lheight
      [{_, "p"}] -> lheight
      _ -> []
    end)

    h_last = (case find_coord(%Chesseract.Board{positions: positions}, {Enum.at(Enum.filter((case lheight do
      1 -> 1
      2 -> 1
      end)..1, fn h ->
      case find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
        [{_, nil}] -> false
        _ -> true
      end
    end), 0), lwidth, lranks, lfiles}) do
      [{_, "r"}] -> lheight
      [{_, "n"}] -> lheight
      [{_, "b"}] -> lheight
      [{_, "k"}] -> lheight
      [{_, "q"}] -> lheight
      [{_, "p"}] -> lheight
      _ -> []
    end)

    w_up = Enum.take_while((case lwidth do
      1 -> 2
      2 -> 2
      end)..2, fn w ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    w_down = Enum.take_while((case lwidth do
      1 -> 1
      2 -> 1
      end)..1, fn w ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    w_first = (case find_coord(%Chesseract.Board{positions: positions}, {lheight, Enum.at(Enum.filter((case lwidth do
      1 -> 2
      2 -> 2
      end)..2, fn w ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
        [{_, nil}] -> false
        _ -> true
      end
    end), 0), lranks, lfiles}) do
      [{_, "r"}] -> lwidth
      [{_, "n"}] -> lwidth
      [{_, "b"}] -> lwidth
      [{_, "k"}] -> lwidth
      [{_, "q"}] -> lwidth
      [{_, "p"}] -> lwidth
      _ -> []
    end)

    w_last = (case find_coord(%Chesseract.Board{positions: positions}, {lheight, Enum.at(Enum.filter((case lwidth do
      1 -> 1
      2 -> 1
      end)..1, fn w ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
        [{_, nil}] -> false
        _ -> true
      end
    end), 0), lranks, lfiles}) do
      [{_, "r"}] -> lwidth
      [{_, "n"}] -> lwidth
      [{_, "b"}] -> lwidth
      [{_, "k"}] -> lwidth
      [{_, "q"}] -> lwidth
      [{_, "p"}] -> lwidth
      _ -> []
    end)

    r_up = Enum.take_while((case lranks do
      8 -> 8
      _ -> lranks + 1
      end)..8, fn r ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    r_down = Enum.take_while((case lranks do
      1 -> 1
      _ -> lranks - 1
      end)..1, fn r ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    r_first = (case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, Enum.at(Enum.filter((case lranks do
      8 -> 8
      _ -> lranks + 1
      end)..8, fn r ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
        [{_, nil}] -> false
        _ -> true
      end
    end), 0), lfiles}) do
      [{_, "r"}] -> lranks
      [{_, "n"}] -> lranks
      [{_, "b"}] -> lranks
      [{_, "k"}] -> lranks
      [{_, "q"}] -> lranks
      [{_, "p"}] -> lranks
      _ -> []
    end)

    r_last = (case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, Enum.at(Enum.filter((case lranks do
      1 -> 1
      _ -> lranks - 1
      end)..1, fn r ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
        [{_, nil}] -> false
        _ -> true
      end
    end), 0), lfiles}) do
      [{_, "r"}] -> lranks
      [{_, "n"}] -> lranks
      [{_, "b"}] -> lranks
      [{_, "k"}] -> lranks
      [{_, "q"}] -> lranks
      [{_, "p"}] -> lranks
      _ -> []
    end)

    f_up = Enum.take_while((case lfiles do
      8 -> 8
      _ -> lfiles + 1
      end)..8, fn f ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    f_down = Enum.take_while((case lfiles do
      1 -> 1
      _ -> lfiles - 1
      end)..1, fn f ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    f_first = (case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, Enum.at(Enum.filter((case lfiles do
      8 -> 8
      _ -> lfiles + 1
      end)..8, fn f ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
        [{_, nil}] -> false
        _ -> true
      end
    end), 0)}) do
      [{_, "r"}] -> lfiles
      [{_, "n"}] -> lfiles
      [{_, "b"}] -> lfiles
      [{_, "k"}] -> lfiles
      [{_, "q"}] -> lfiles
      [{_, "p"}] -> lfiles
      _ -> []
    end)

    f_last = (case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, Enum.at(Enum.filter((case lfiles do
      1 -> 1
      _ -> lfiles - 1
      end)..1, fn f ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
        [{_, nil}] -> false
        _ -> true
      end
    end), 0)}) do
      [{_, "r"}] -> lfiles
      [{_, "n"}] -> lfiles
      [{_, "b"}] -> lfiles
      [{_, "k"}] -> lfiles
      [{_, "q"}] -> lfiles
      [{_, "p"}] -> lfiles
      _ -> []
    end)

    h_moves = h_up ++ h_down ++ h_first ++ h_last
    w_moves = w_up ++ w_down ++ w_first ++ w_last
    r_moves = r_up ++ r_down ++ r_first ++ r_last
    f_moves = f_up ++ f_down ++ f_first ++ f_last

    format_h_moves = Enum.map(h_moves, fn h -> {h, lwidth, lranks, lfiles} end)
    format_w_moves = Enum.map(w_moves, fn w -> {lheight, w, lranks, lfiles} end)
    format_r_moves = Enum.map(r_moves, fn r -> {lheight, lwidth, r, lfiles} end)
    format_f_moves = Enum.map(f_moves, fn f -> {lheight, lwidth, lranks, f} end)

    all_moves = format_h_moves ++ format_w_moves ++ format_r_moves ++ format_f_moves

    rook_moves = Enum.map(all_moves, fn move -> find_coord(%Chesseract.Board{positions: positions}, move) end)

    if rook_moves == [] do
      IO.puts("No valid moves for this piece, please select another!")
      #select_coordinates(%Chesseract.Board{positions: positions})
    else
      indexed_rook_moves = Enum.with_index(rook_moves)
      IO.inspect(indexed_rook_moves)

      #To be replaced with UI
      user_int = IO.gets("Please input the integer corresponding to the move you would like to make:")
      |> String.trim()
      |> String.to_integer
      selected_move = Enum.at(rook_moves, user_int)

      make_move(find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, lfiles}), selected_move, %Chesseract.Board{positions: positions})
    #Overwrite the selected move value with "R"
    #Overwrite the old position value with nil
    #How do I do that?
    end
  end


  defp find_coord(%Chesseract.Board{positions: positions}, input) do
   # IO.puts("weak_inspect_coord started")
    {lheight, lwidth, lranks, lfiles} = input

    Enum.filter(positions, fn {key, _value} ->
       key == :"H#{lheight},W#{lwidth},R#{lranks},F#{lfiles}"
    end)
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

  def make_move([{from_key, from_value}], [{to_key, _}], %Chesseract.Board{positions: positions}) do
    new_positions = positions
    |> Enum.map(fn {key, value} -> if key == from_key, do: {key, nil}, else: {key, value} end)
    |> Enum.map(fn {key, value} -> if key == to_key, do: {key, from_value}, else: {key, value} end)

    IO.inspect(%Chesseract.Board{
      positions: new_positions
    }, limit: :infinity)
  end

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

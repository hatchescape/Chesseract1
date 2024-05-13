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
        {_, nil} -> true
        _ -> false
      end
    end)

    h_down = Enum.take_while(2..(case lheight do
      1 -> 1
      2 -> 1
      end), fn h ->
      case find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
        {_, nil} -> true
        _ -> false
      end
    end)
    #                                                                           \/ might need to compile a map here from enum.filter, or else enum.at will just run multiple times for each value intead of returning the first of the set. Maybe not though, might be fine.
    h_first = (case find_coord(%Chesseract.Board{positions: positions}, {Enum.at(Enum.filter((case lheight do
      1 -> 2
      2 -> 2
      end)..2, fn h ->
      case find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
        {_, nil} -> false
        _ -> true
      end
    end), 0), lwidth, lranks, lfiles}) do
      {_, "r"} -> lheight
      {_, "n"} -> lheight
      {_, "b"} -> lheight
      {_, "k"} -> lheight
      {_, "q"} -> lheight
      {_, "p"} -> lheight
      _ -> nil
    end)

    h_last = (case find_coord(%Chesseract.Board{positions: positions}, {Enum.at(Enum.filter(2..(case lheight do
      1 -> 1
      2 -> 1
      end), fn h ->
      case find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
        {_, nil} -> false
        _ -> true
      end
    end), 0), lwidth, lranks, lfiles}) do
      {_, "r"} -> lheight
      {_, "n"} -> lheight
      {_, "b"} -> lheight
      {_, "k"} -> lheight
      {_, "q"} -> lheight
      {_, "p"} -> lheight
      _ -> nil
    end)

    w_up = Enum.take_while((case lwidth do
      1 -> 2
      2 -> 2
      end)..2, fn w ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
        {_, nil} -> true
        _ -> false
      end
    end)

    w_down = Enum.take_while(2..(case lwidth do
      1 -> 1
      2 -> 1
      end), fn w ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
        {_, nil} -> true
        _ -> false
      end
    end)

    w_first = (case find_coord(%Chesseract.Board{positions: positions}, {lheight, Enum.at(Enum.filter((case lwidth do
      1 -> 2
      2 -> 2
      end)..2, fn w ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
        {_, nil} -> false
        _ -> true
      end
    end), 0), lranks, lfiles}) do
      {_, "r"} -> lwidth
      {_, "n"} -> lwidth
      {_, "b"} -> lwidth
      {_, "k"} -> lwidth
      {_, "q"} -> lwidth
      {_, "p"} -> lwidth
      _ -> nil
    end)

    w_last = (case find_coord(%Chesseract.Board{positions: positions}, {lheight, Enum.at(Enum.filter(2..(case lwidth do
      1 -> 1
      2 -> 1
      end), fn w ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
        {_, nil} -> false
        _ -> true
      end
    end), 0), lranks, lfiles}) do
      {_, "r"} -> lwidth
      {_, "n"} -> lwidth
      {_, "b"} -> lwidth
      {_, "k"} -> lwidth
      {_, "q"} -> lwidth
      {_, "p"} -> lwidth
      _ -> nil
    end)

    r_up = Enum.take_while((case lranks do
      8 -> 8
      _ -> lranks + 1
      end)..8, fn r ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
        {_, nil} -> true
        _ -> false
      end
    end)

    r_down = Enum.take_while(8..(case lranks do
      1 -> 1
      _ -> lranks - 1
      end), fn r ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
        {_, nil} -> true
        _ -> false
      end
    end)

    r_first = (case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, Enum.at(Enum.filter((case lranks do
      8 -> 8
      _ -> lranks + 1
      end)..8, fn r ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
        {_, nil} -> false
        _ -> true
      end
    end), 0), lfiles}) do
      {_, "r"} -> lranks
      {_, "n"} -> lranks
      {_, "b"} -> lranks
      {_, "k"} -> lranks
      {_, "q"} -> lranks
      {_, "p"} -> lranks
      _ -> nil
    end)

    r_last = (case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, Enum.at(Enum.filter(8..(case lranks do
      1 -> 1
      _ -> lranks - 1
      end), fn r ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
        {_, nil} -> false
        _ -> true
      end
    end), 0), lfiles}) do
      {_, "r"} -> lranks
      {_, "n"} -> lranks
      {_, "b"} -> lranks
      {_, "k"} -> lranks
      {_, "q"} -> lranks
      {_, "p"} -> lranks
      _ -> nil
    end)

    f_up = Enum.take_while((case lfiles do
      8 -> 8
      _ -> lfiles + 1
      end)..8, fn f ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
        {_, nil} -> true
        _ -> false
      end
    end)

    f_down = Enum.take_while(8..(case lfiles do
      1 -> 1
      _ -> lfiles - 1
      end), fn f ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
        {_, nil} -> true
        _ -> false
      end
    end)

    f_first = (case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, Enum.at(Enum.filter((case lfiles do
      8 -> 8
      _ -> lfiles + 1
      end)..8, fn f ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
        {_, nil} -> false
        _ -> true
      end
    end), 0)}) do
      {_, "r"} -> lfiles
      {_, "n"} -> lfiles
      {_, "b"} -> lfiles
      {_, "k"} -> lfiles
      {_, "q"} -> lfiles
      {_, "p"} -> lfiles
      _ -> nil
    end)

    f_last = (case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, Enum.at(Enum.filter(8..(case lfiles do
      1 -> 1
      _ -> lfiles - 1
      end), fn f ->
      case find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
        {_, nil} -> false
        _ -> true
      end
    end), 0)}) do
      {_, "r"} -> lfiles
      {_, "n"} -> lfiles
      {_, "b"} -> lfiles
      {_, "k"} -> lfiles
      {_, "q"} -> lfiles
      {_, "p"} -> lfiles
      _ -> nil
    end)

    h_moves = (h_up || []) ++ (h_down || []) ++ (h_first || []) ++ (h_last || [])
    w_moves = (w_up || []) ++ (w_down || []) ++ (w_first || []) ++ (w_last || [])
    r_moves = (r_up || []) ++ (r_down || []) ++ (r_first || []) ++ (r_last || [])
    f_moves = (f_up || []) ++ (f_down || []) ++ (f_first || []) ++ (f_last || [])

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
    user_int = IO.gets("Please input the integer corresponding to the move you would like to make:")
    selected_move = {_, move, value} = Enum.filter(indexed_rook_moves, fn {key, _} -> key == user_int end)
    #Overwrite the selected move value with "R"
    #Overwrite the old position value with nil
    #How do I do that?
    end
    #IO.inspect height_moves
    # ++
    # (for height <- 2..1, height < lheight, do: Enum.take_while(height, fn h ->
    #   case find_coord(%Chesseract.Board{positions: positions}, [h, lwidth, lranks, lfiles]) do
    #     {_, nil} -> true
    #     _ -> false
    #   end
    # end))
    # ++
    # (for height <- 1..2, height > lheight, do: Enum.at(Enum.filter(height, fn h ->
    #   case find_coord(%Chesseract.Board{positions: positions}, [h, lwidth, lranks, lfiles]) do
    #     {_, "r"} -> true
    #     {_, "n"} -> true
    #     {_, "b"} -> true
    #     {_, "k"} -> true
    #     {_, "q"} -> true
    #     {_, "p"} -> true
    #     _ -> false
    #    end
    #   end), 0))
    #   ++
    #   (for height <- 2..1, height < lheight, do: Enum.at(Enum.filter([height], fn h ->
    #     case find_coord(%Chesseract.Board{positions: positions}, [h, lwidth, lranks, lfiles]) do
    #       {_, "r"} -> true
    #       {_, "n"} -> true
    #       {_, "b"} -> true
    #       {_, "k"} -> true
    #       {_, "q"} -> true
    #       {_, "p"} -> true
    #       _ -> false
    #      end
    #     end), 0))

    # width_moves = (for width <- 1..2, width > lwidth, do: Enum.take_while(width, fn w ->
    #   case find_coord(%Chesseract.Board{positions: positions}, [lheight, w, lranks, lfiles]) do
    #     {_, nil} -> true
    #     _ -> false
    #   end
    # end))
    # ++
    # (for width <- 2..1, width < lwidth, do: Enum.take_while(width, fn w ->
    #   case find_coord(%Chesseract.Board{positions: positions}, [lheight, w, lranks, lfiles]) do
    #     {_, nil} -> true
    #     _ -> false
    #   end
    # end))
    # ++
    # (for width <- 1..2, width > lwidth, do: Enum.at(Enum.filter(width, fn w ->
    #   case find_coord(%Chesseract.Board{positions: positions}, [lheight, w, lranks, lfiles]) do
    #     {_, "r"} -> true
    #     {_, "n"} -> true
    #     {_, "b"} -> true
    #     {_, "k"} -> true
    #     {_, "q"} -> true
    #     {_, "p"} -> true
    #     _ -> false
    #    end
    #   end), 0))
    #   ++
    #   (for width <- 2..1, width < lwidth, do: Enum.at(Enum.filter(width, fn w ->
    #     case find_coord(%Chesseract.Board{positions: positions}, [lheight, w, lranks, lfiles]) do
    #       {_, "r"} -> true
    #       {_, "n"} -> true
    #       {_, "b"} -> true
    #       {_, "k"} -> true
    #       {_, "q"} -> true
    #       {_, "p"} -> true
    #       _ -> false
    #      end
    #     end), 0))

    # rank_moves = (for ranks <- 1..8, ranks > lranks, do: Enum.take_while(ranks, fn r ->
    #   case find_coord(%Chesseract.Board{positions: positions}, [lheight, lwidth, r, lfiles]) do
    #     {_, nil} -> true
    #     _ -> false
    #   end
    # end))
    # ++
    # (for ranks <- 8..1, ranks < lranks, do: Enum.take_while(ranks, fn r ->
    #   case find_coord(%Chesseract.Board{positions: positions}, [lheight, lwidth, r, lfiles]) do
    #     {_, nil} -> true
    #     _ -> false
    #   end
    # end))
    # ++
    # (for ranks <- 1..8, ranks > lranks, do: Enum.at(Enum.filter(ranks, fn r ->
    #   case find_coord(%Chesseract.Board{positions: positions}, [lheight, lwidth, r, lfiles]) do
    #     {_, "r"} -> true
    #     {_, "n"} -> true
    #     {_, "b"} -> true
    #     {_, "k"} -> true
    #     {_, "q"} -> true
    #     {_, "p"} -> true
    #     _ -> false
    #    end
    #   end), 0))
    #   ++
    #   (for ranks <- 8..1, ranks < lranks, do: Enum.at(Enum.filter(ranks, fn r ->
    #     case find_coord(%Chesseract.Board{positions: positions}, [lheight, lwidth, r, lfiles]) do
    #       {_, "r"} -> true
    #       {_, "n"} -> true
    #       {_, "b"} -> true
    #       {_, "k"} -> true
    #       {_, "q"} -> true
    #       {_, "p"} -> true
    #       _ -> false
    #      end
    #     end), 0))

    # file_moves = (for files <- 1..8, files > lfiles, do: Enum.take_while(files, fn f ->
    #   case find_coord(%Chesseract.Board{positions: positions}, [lheight, lwidth, lranks, f]) do
    #     {_, nil} -> true
    #     _ -> false
    #   end
    # end))
    # ++
    # (for files <- 8..1, files < lfiles, do: Enum.take_while(files, fn f ->
    #   case find_coord(%Chesseract.Board{positions: positions}, [lheight, lwidth, lranks, f]) do
    #     {_, nil} -> true
    #     _ -> false
    #   end
    # end))
    # ++
    # (for files <- 1..8, files > lfiles, do: Enum.at(Enum.filter(files, fn f ->
    #   case find_coord(%Chesseract.Board{positions: positions}, [lheight, lwidth, lranks, f]) do
    #     {_, "r"} -> true
    #     {_, "n"} -> true
    #     {_, "b"} -> true
    #     {_, "k"} -> true
    #     {_, "q"} -> true
    #     {_, "p"} -> true
    #     _ -> false
    #    end
    #   end), 0))
    #   ++
    #   (for files <- 8..1, files < lfiles, do: Enum.at(Enum.filter(files, fn f ->
    #     case find_coord(%Chesseract.Board{positions: positions}, [lheight, lwidth, lranks, f]) do
    #       {_, "r"} -> true
    #       {_, "n"} -> true
    #       {_, "b"} -> true
    #       {_, "k"} -> true
    #       {_, "q"} -> true
    #       {_, "p"} -> true
    #       _ -> false
    #      end
    #     end), 0))


    # height_moves ++ width_moves ++ rank_moves ++ file_moves
    # |> IO.inspect()
    # |> Enum.map(&find_coord(%Chesseract.Board{positions: positions}, &1))
    # |> List.flatten() #here are all rook moves from coord with pieces, should proabably trim further to exclude player pieces
    # |> Enum.map(&trim_coord(&1))
    # |> Enum.map(&rook_stuff(%Chesseract.Board{positions: positions}, &1, lheight, lwidth, lranks, lfiles)) #returns list of all invalid passed-piece rook moves, if I invert it will it return only valid? No, because of overlap, shit. Oh well.
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

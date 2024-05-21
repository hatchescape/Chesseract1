defmodule Chesseract.Game do

  def white_turn(%Chesseract.Board{positions: positions}) do
    [lheight, lwidth, lranks, lfiles] =
      IO.gets("Player white; Please enter coordinates in the format H,W,R,F:")
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
        IO.puts("there's a black rook here! Not your piece; please try again")
        white_turn(%Chesseract.Board{positions: positions})

      [{_, "R"}] ->
        IO.puts("there's a white rook here!")
        Chesseract.Pieces.Rook.wrmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "n"}] ->
        IO.puts("there's a black knight here! Not your piece; please try again")
        white_turn(%Chesseract.Board{positions: positions})

      [{_, "N"}] ->
        IO.puts("there's a white knight here!")
        Chesseract.Pieces.Knight.wnmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "b"}] ->
        IO.puts("there's a black bishop here! Not your piece; please try again")
        white_turn(%Chesseract.Board{positions: positions})

      [{_, "B"}] ->
        IO.puts("there's a white bishop here!")
        Chesseract.Pieces.Bishop.wbmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "k"}] ->
        IO.puts("there's a black king here! Not your piece; please try again")
        white_turn(%Chesseract.Board{positions: positions})

      [{_, "K"}] ->
        IO.puts("there's a white king here!")
        Chesseract.Pieces.King.wkmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "q"}] ->
        IO.puts("there's a black queen here! Not your piece; please try again")
        white_turn(%Chesseract.Board{positions: positions})

      [{_, "Q"}] ->
        IO.puts("there's a white queen here!")
        Chesseract.Pieces.Queen.wqmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "p"}] ->
        IO.puts("there's a black pawn here! Not your piece; please try again")
        white_turn(%Chesseract.Board{positions: positions})

      [{_, "P"}] ->
        IO.puts("there's a white pawn here!")
        Chesseract.Pieces.Pawn.wpmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      result ->
        IO.inspect(result)
        IO.puts("No piece found at the specified coordinates; please try again")
        white_turn(%Chesseract.Board{positions: positions})
    end
  end



  def black_turn(%Chesseract.Board{positions: positions}) do
    [lheight, lwidth, lranks, lfiles] =
      IO.gets("Player black; Please enter coordinates in the format H,W,R,F:")
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
        IO.puts("there's a black rook here!")
        Chesseract.Pieces.Rook.brmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "R"}] ->
        IO.puts("there's a white rook here! Not your piece; please try again")
        black_turn(%Chesseract.Board{positions: positions})

      [{_, "n"}] ->
        IO.puts("there's a black knight here!")
        Chesseract.Pieces.Knight.bnmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "N"}] ->
        IO.puts("there's a white knight here! Not your piece; please try again")
        black_turn(%Chesseract.Board{positions: positions})

      [{_, "b"}] ->
        IO.puts("there's a black bishop here!")
        Chesseract.Pieces.Bishop.bbmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "B"}] ->
        IO.puts("there's a white bishop here! Not your piece; please try again")
        black_turn(%Chesseract.Board{positions: positions})

      [{_, "k"}] ->
        IO.puts("there's a black king here!")
        Chesseract.Pieces.King.bkmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "K"}] ->
        IO.puts("there's a white king here! Not your piece; please try again")
        black_turn(%Chesseract.Board{positions: positions})

      [{_, "q"}] ->
        IO.puts("there's a black queen here!")
        Chesseract.Pieces.Queen.bqmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "Q"}] ->
        IO.puts("there's a white queen here! Not your piece; please try again")
        black_turn(%Chesseract.Board{positions: positions})

      [{_, "p"}] ->
        IO.puts("there's a black pawn here!")
        Chesseract.Pieces.Pawn.bpmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions})

      [{_, "P"}] ->
        IO.puts("there's a white pawn here! Not your piece; please try again")
        black_turn(%Chesseract.Board{positions: positions})

      result ->
        IO.inspect(result)
        IO.puts("No piece found at the specified coordinates. Please try again.")
        black_turn(%Chesseract.Board{positions: positions})
    end
  end



end

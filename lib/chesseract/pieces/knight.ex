defmodule Chesseract.Pieces.Knight do

  def wnmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do

    n_moves = Enum.reject((case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + 1), lwidth, (lranks + 2), lfiles}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{(lheight + 1), lwidth, (lranks + 2), lfiles}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + 1), lwidth, (lranks - 2), lfiles}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{(lheight + 1), lwidth, (lranks - 2), lfiles}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - 1), lwidth, (lranks + 2), lfiles}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{(lheight - 1), lwidth, (lranks + 2), lfiles}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - 1), lwidth, (lranks - 2), lfiles}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{(lheight - 1), lwidth, (lranks - 2), lfiles}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + 1), lwidth, lranks, (lfiles + 2)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{(lheight + 1), lwidth, lranks, (lfiles + 2)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + 1), lwidth, lranks, (lfiles - 2)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{(lheight + 1), lwidth, lranks, (lfiles - 2)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - 1), lwidth, lranks, (lfiles + 2)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{(lheight - 1), lwidth, lranks, (lfiles + 2)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - 1), lwidth, lranks, (lfiles - 2)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{(lheight - 1), lwidth, lranks, (lfiles - 2)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + 1), (lranks + 2), lfiles}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, (lwidth + 1), (lranks + 2), lfiles}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + 1), (lranks - 2), lfiles}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, (lwidth + 1), (lranks - 2), lfiles}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - 1), (lranks + 2), lfiles}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, (lwidth - 1), (lranks + 2), lfiles}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - 1), (lranks - 2), lfiles}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, (lwidth - 1), (lranks - 2), lfiles}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + 1), lranks, (lfiles + 2)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, (lwidth + 1), lranks, (lfiles + 2)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + 1), lranks, (lfiles - 2)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, (lwidth + 1), lranks, (lfiles - 2)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - 1), lranks, (lfiles + 2)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, (lwidth - 1), lranks, (lfiles + 2)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - 1), lranks, (lfiles - 2)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, (lwidth - 1), lranks, (lfiles - 2)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + 1), (lfiles + 2)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, lwidth, (lranks + 1), (lfiles + 2)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + 1), (lfiles - 2)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, lwidth, (lranks + 1), (lfiles - 2)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - 1), (lfiles + 2)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, lwidth, (lranks - 1), (lfiles + 2)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - 1), (lfiles - 2)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, lwidth, (lranks - 1), (lfiles - 2)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + 2), (lfiles + 1)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, lwidth, (lranks + 2), (lfiles + 1)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + 2), (lfiles - 1)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, lwidth, (lranks + 2), (lfiles - 1)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - 2), (lfiles + 1)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, lwidth, (lranks - 2), (lfiles + 1)}]
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - 2), (lfiles - 1)}) do
      [{_, "R"}] -> []
      [{_, "N"}] -> []
      [{_, "B"}] -> []
      [{_, "K"}] -> []
      [{_, "Q"}] -> []
      [{_, "P"}] -> []
      _ -> [{lheight, lwidth, (lranks - 2), (lfiles - 1)}]
    end), &(&1 == []))

    f_n_moves = Enum.map(n_moves, fn n -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, n) end)

    if f_n_moves == [] do
      IO.puts("No valid moves for this piece, please select another!")
      Chesseract.Game.white_turn(%Chesseract.Board{positions: positions})
    else
      indexed_n_moves = Enum.with_index(f_n_moves)
      IO.inspect(indexed_n_moves)

      #To be replaced with UI
      user_int = IO.gets("Please input the integer corresponding to the move you would like to make:")
      |> String.trim()
      |> String.to_integer
      selected_move = Enum.at(f_n_moves, user_int)
      IO.inspect(selected_move)

      Chesseract.Helper.make_move(Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, lfiles}), selected_move, %Chesseract.Board{positions: positions})
      |> Chesseract.Game.black_turn()
  end
end


  def bnmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do

    n_moves = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + 1), lwidth, (lranks + 2), lfiles}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + 1), lwidth, (lranks + 2), lfiles})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + 1), lwidth, (lranks - 2), lfiles}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + 1), lwidth, (lranks - 2), lfiles})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - 1), lwidth, (lranks + 2), lfiles}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - 1), lwidth, (lranks + 2), lfiles})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - 1), lwidth, (lranks - 2), lfiles}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - 1), lwidth, (lranks - 2), lfiles})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + 1), (lranks + 2), lfiles}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + 1), (lranks + 2), lfiles})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + 1), (lranks - 2), lfiles}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + 1), (lranks - 2), lfiles})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - 1), (lranks + 2), lfiles}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - 1), (lranks + 2), lfiles})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - 1), (lranks - 2), lfiles}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - 1), (lranks - 2), lfiles})
    end

    ++


    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + 1), (lfiles + 2)}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + 1), (lfiles + 2)})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + 1), (lfiles - 2)}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + 1), (lfiles - 2)})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - 1), (lfiles + 2)}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - 1), (lfiles + 2)})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - 1), (lfiles - 2)}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - 1), (lfiles - 2)})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + 2), (lfiles + 1)}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + 2), (lfiles + 1)})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + 2), (lfiles - 1)}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + 2), (lfiles - 1)})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - 2), (lfiles + 1)}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - 2), (lfiles + 1)})
    end

    ++

    case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - 2), (lfiles - 1)}) do
      [{_, "r"}] -> []
      [{_, "n"}] -> []
      [{_, "b"}] -> []
      [{_, "k"}] -> []
      [{_, "q"}] -> []
      [{_, "p"}] -> []
      _ -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - 2), (lfiles - 1)})
    end)

    if n_moves == [] do
      IO.puts("No valid moves for this piece, please select another!")
      Chesseract.Game.black_turn(%Chesseract.Board{positions: positions})
    else
      indexed_n_moves = Enum.with_index(n_moves)
      IO.inspect(indexed_n_moves)

      #To be replaced with UI
      user_int = IO.gets("Please input the integer corresponding to the move you would like to make:")
      |> String.trim()
      |> String.to_integer
      selected_move = Enum.at(n_moves, user_int)

      Chesseract.Helper.make_move(Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, lfiles}), selected_move, %Chesseract.Board{positions: positions})
      |> Chesseract.Game.white_turn()
    end
  end

end

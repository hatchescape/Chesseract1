defmodule Chesseract.Pieces.Rook do

    def wrmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do

        h_up = Enum.take_while((case lheight do
          1 -> 2
          2 -> 2
          end)..2, fn h ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        h_down = Enum.take_while((case lheight do
          1 -> 1
          2 -> 1
          end)..1, fn h ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)
        #                                                                           \/ might need to compile a map here from enum.filter, or else enum.at will just run multiple times for each value intead of returning the first of the set. Maybe not though, might be fine.
        h_first = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {Enum.at(Enum.filter((case lheight do
          1 -> 2
          2 -> 2
          end)..2, fn h ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
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

        h_last = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {Enum.at(Enum.filter((case lheight do
          1 -> 1
          2 -> 1
          end)..1, fn h ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
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
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        w_down = Enum.take_while((case lwidth do
          1 -> 1
          2 -> 1
          end)..1, fn w ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        w_first = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, Enum.at(Enum.filter((case lwidth do
          1 -> 2
          2 -> 2
          end)..2, fn w ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
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

        w_last = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, Enum.at(Enum.filter((case lwidth do
          1 -> 1
          2 -> 1
          end)..1, fn w ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
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
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        r_down = Enum.take_while((case lranks do
          1 -> 1
          _ -> lranks - 1
          end)..1, fn r ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        r_first = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, Enum.at(Enum.filter((case lranks do
          8 -> 8
          _ -> lranks + 1
          end)..8, fn r ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
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

        r_last = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, Enum.at(Enum.filter((case lranks do
          1 -> 1
          _ -> lranks - 1
          end)..1, fn r ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
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
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        f_down = Enum.take_while((case lfiles do
          1 -> 1
          _ -> lfiles - 1
          end)..1, fn f ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        f_first = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, Enum.at(Enum.filter((case lfiles do
          8 -> 8
          _ -> lfiles + 1
          end)..8, fn f ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
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

        f_last = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, Enum.at(Enum.filter((case lfiles do
          1 -> 1
          _ -> lfiles - 1
          end)..1, fn f ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
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

        rook_moves = Enum.map(all_moves, fn move -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, move) end)

        if rook_moves == [] do
          IO.puts("No valid moves for this piece, please select another!")
          Chesseract.Game.white_turn(%Chesseract.Board{positions: positions})
        else
          indexed_rook_moves = Enum.with_index(rook_moves)
          IO.inspect(indexed_rook_moves)

          #To be replaced with UI
          user_int = IO.gets("Please input the integer corresponding to the move you would like to make:")
          |> String.trim()
          |> String.to_integer
          selected_move = Enum.at(rook_moves, user_int)

          Chesseract.Helper.make_move(Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, lfiles}), selected_move, %Chesseract.Board{positions: positions})
          |> Chesseract.Game.black_turn()
        end
      end














      def brmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do

        h_up = Enum.take_while((case lheight do
          1 -> 2
          2 -> 2
          end)..2, fn h ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        h_down = Enum.take_while((case lheight do
          1 -> 1
          2 -> 1
          end)..1, fn h ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        h_first = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {Enum.at(Enum.filter((case lheight do
          1 -> 2
          2 -> 2
          end)..2, fn h ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
            [{_, nil}] -> false
            _ -> true
          end
        end), 0), lwidth, lranks, lfiles}) do
          [{_, "R"}] -> lheight
          [{_, "N"}] -> lheight
          [{_, "B"}] -> lheight
          [{_, "K"}] -> lheight
          [{_, "Q"}] -> lheight
          [{_, "P"}] -> lheight
          _ -> []
        end)

        h_last = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {Enum.at(Enum.filter((case lheight do
          1 -> 1
          2 -> 1
          end)..1, fn h ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {h, lwidth, lranks, lfiles}) do
            [{_, nil}] -> false
            _ -> true
          end
        end), 0), lwidth, lranks, lfiles}) do
          [{_, "R"}] -> lheight
          [{_, "N"}] -> lheight
          [{_, "B"}] -> lheight
          [{_, "K"}] -> lheight
          [{_, "Q"}] -> lheight
          [{_, "P"}] -> lheight
          _ -> []
        end)

        w_up = Enum.take_while((case lwidth do
          1 -> 2
          2 -> 2
          end)..2, fn w ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        w_down = Enum.take_while((case lwidth do
          1 -> 1
          2 -> 1
          end)..1, fn w ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        w_first = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, Enum.at(Enum.filter((case lwidth do
          1 -> 2
          2 -> 2
          end)..2, fn w ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
            [{_, nil}] -> false
            _ -> true
          end
        end), 0), lranks, lfiles}) do
          [{_, "R"}] -> lwidth
          [{_, "N"}] -> lwidth
          [{_, "B"}] -> lwidth
          [{_, "K"}] -> lwidth
          [{_, "Q"}] -> lwidth
          [{_, "P"}] -> lwidth
          _ -> []
        end)

        w_last = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, Enum.at(Enum.filter((case lwidth do
          1 -> 1
          2 -> 1
          end)..1, fn w ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, w, lranks, lfiles}) do
            [{_, nil}] -> false
            _ -> true
          end
        end), 0), lranks, lfiles}) do
          [{_, "R"}] -> lwidth
          [{_, "N"}] -> lwidth
          [{_, "B"}] -> lwidth
          [{_, "K"}] -> lwidth
          [{_, "Q"}] -> lwidth
          [{_, "P"}] -> lwidth
          _ -> []
        end)

        r_up = Enum.take_while((case lranks do
          8 -> 8
          _ -> lranks + 1
          end)..8, fn r ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        r_down = Enum.take_while((case lranks do
          1 -> 1
          _ -> lranks - 1
          end)..1, fn r ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        r_first = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, Enum.at(Enum.filter((case lranks do
          8 -> 8
          _ -> lranks + 1
          end)..8, fn r ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
            [{_, nil}] -> false
            _ -> true
          end
        end), 0), lfiles}) do
          [{_, "R"}] -> lranks
          [{_, "N"}] -> lranks
          [{_, "B"}] -> lranks
          [{_, "K"}] -> lranks
          [{_, "Q"}] -> lranks
          [{_, "P"}] -> lranks
          _ -> []
        end)

        r_last = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, Enum.at(Enum.filter((case lranks do
          1 -> 1
          _ -> lranks - 1
          end)..1, fn r ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, r, lfiles}) do
            [{_, nil}] -> false
            _ -> true
          end
        end), 0), lfiles}) do
          [{_, "R"}] -> lranks
          [{_, "N"}] -> lranks
          [{_, "B"}] -> lranks
          [{_, "K"}] -> lranks
          [{_, "Q"}] -> lranks
          [{_, "P"}] -> lranks
          _ -> []
        end)

        f_up = Enum.take_while((case lfiles do
          8 -> 8
          _ -> lfiles + 1
          end)..8, fn f ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        f_down = Enum.take_while((case lfiles do
          1 -> 1
          _ -> lfiles - 1
          end)..1, fn f ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
            [{_, nil}] -> true
            _ -> false
          end
        end)

        f_first = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, Enum.at(Enum.filter((case lfiles do
          8 -> 8
          _ -> lfiles + 1
          end)..8, fn f ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
            [{_, nil}] -> false
            _ -> true
          end
        end), 0)}) do
          [{_, "R"}] -> lfiles
          [{_, "N"}] -> lfiles
          [{_, "B"}] -> lfiles
          [{_, "K"}] -> lfiles
          [{_, "Q"}] -> lfiles
          [{_, "P"}] -> lfiles
          _ -> []
        end)

        f_last = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, Enum.at(Enum.filter((case lfiles do
          1 -> 1
          _ -> lfiles - 1
          end)..1, fn f ->
          case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, f}) do
            [{_, nil}] -> false
            _ -> true
          end
        end), 0)}) do
          [{_, "R"}] -> lfiles
          [{_, "N"}] -> lfiles
          [{_, "B"}] -> lfiles
          [{_, "K"}] -> lfiles
          [{_, "Q"}] -> lfiles
          [{_, "P"}] -> lfiles
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

        rook_moves = Enum.map(all_moves, fn move -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, move) end)

        if rook_moves == [] do
          IO.puts("No valid moves for this piece, please select another!")
          Chesseract.Game.black_turn(%Chesseract.Board{positions: positions})
        else
          indexed_rook_moves = Enum.with_index(rook_moves)
          IO.inspect(indexed_rook_moves)

          #To be replaced with UI
          user_int = IO.gets("Please input the integer corresponding to the move you would like to make:")
          |> String.trim()
          |> String.to_integer
          selected_move = Enum.at(rook_moves, user_int)

          Chesseract.Helper.make_move(Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, lfiles}), selected_move, %Chesseract.Board{positions: positions})
          |> Chesseract.Game.white_turn()
        end
      end












end

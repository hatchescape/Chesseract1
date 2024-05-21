defmodule Chesseract.Pieces.Queen do

  def wqmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
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





    hwpp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth + h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hwppf = Enum.map(hwpp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth + h), lranks, lfiles}) end)

    hwpm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth - h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hwpmf = Enum.map(hwpm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth - h), lranks, lfiles}) end)

    hwmm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth - h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hwmmf = Enum.map(hwmm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth - h), lranks, lfiles}) end)

    hwmp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth + h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hwmpf = Enum.map(hwmp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth + h), lranks, lfiles}) end)

    hrpp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hrppf = Enum.map(hrpp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks + h), lfiles}) end)

    hrpm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hrpmf = Enum.map(hrpm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks - h), lfiles}) end)

    hrmm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hrmmf = Enum.map(hrmm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks - h), lfiles}) end)

    hrmp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hrmpf = Enum.map(hrmp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks + h), lfiles}) end)

    hfpp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hfppf = Enum.map(hfpp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles + h)}) end)

    hfpm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hfpmf = Enum.map(hfpm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles - h)}) end)

    hfmm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hfmmf = Enum.map(hfmm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles - h)}) end)

    hfmp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hfmpf = Enum.map(hfmp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles + h)}) end)

    wrpp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wrppf = Enum.map(wrpp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks + h), lfiles}) end)

    wrpm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wrpmf = Enum.map(wrpm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks - h), lfiles}) end)

    wrmm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wrmmf = Enum.map(wrmm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks - h), lfiles}) end)

    wrmp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wrmpf = Enum.map(wrmp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks + h), lfiles}) end)

    wfpp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wfppf = Enum.map(wfpp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles + h)}) end)

    wfpm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wfpmf = Enum.map(wfpm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles - h)}) end)

    wfmm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wfmmf = Enum.map(wfmm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles - h)}) end)

    wfmp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wfmpf = Enum.map(wfmp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles + h)}) end)

    rfpp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    rfppf = Enum.map(rfpp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles + h)}) end)

    rfpm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    rfpmf = Enum.map(rfpm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles - h)}) end)

    rfmm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    rfmmf = Enum.map(rfmm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles - h)}) end)

    rfmp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    rfmpf = Enum.map(rfmp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles + h)}) end)

    b_empty_moves = hwppf ++ hwpmf ++ hwmmf ++ hwmpf ++ hrppf ++ hrpmf ++ hrmmf ++ hrmpf ++ hfppf ++ hfpmf ++ hfmmf ++ hfmpf ++ wrppf ++ wrpmf ++ wrmmf ++ wrmpf ++ wfppf ++ wfpmf ++ wfmmf ++ wfmpf ++ rfppf ++ rfpmf ++ rfmmf ++ rfmpf







    hwppfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth + h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0) || 0


    hwppc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight + hwppfp), (lwidth + hwppfp), lranks, lfiles}) do
      [{_, "r"}] -> hwppfp
      [{_, "n"}] -> hwppfp
      [{_, "b"}] -> hwppfp
      [{_, "k"}] -> hwppfp
      [{_, "q"}] -> hwppfp
      [{_, "p"}] -> hwppfp
      _ -> []
    end)

    hwppcf = Enum.map(hwppc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth + h), lranks, lfiles}) end)

    hwpmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth - h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hwpmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight + hwpmfp), (lwidth - hwpmfp), lranks, lfiles}) do
      [{_, "r"}] -> hwpmfp
      [{_, "n"}] -> hwpmfp
      [{_, "b"}] -> hwpmfp
      [{_, "k"}] -> hwpmfp
      [{_, "q"}] -> hwpmfp
      [{_, "p"}] -> hwpmfp
      _ -> []
    end)

    hwpmcf = Enum.map(hwpmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth - h), lranks, lfiles}) end)

    hwmmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth - h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hwmmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight - hwmmfp), (lwidth - hwmmfp), lranks, lfiles}) do
      [{_, "r"}] -> hwmmfp
      [{_, "n"}] -> hwmmfp
      [{_, "b"}] -> hwmmfp
      [{_, "k"}] -> hwmmfp
      [{_, "q"}] -> hwmmfp
      [{_, "p"}] -> hwmmfp
      _ -> []
    end)

    hwmmcf = Enum.map(hwmmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth - h), lranks, lfiles}) end)

    hwmpfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth + h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hwmpc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight - hwmpfp), (lwidth + hwmpfp), lranks, lfiles}) do
      [{_, "r"}] -> hwmpfp
      [{_, "n"}] -> hwmpfp
      [{_, "b"}] -> hwmpfp
      [{_, "k"}] -> hwmpfp
      [{_, "q"}] -> hwmpfp
      [{_, "p"}] -> hwmpfp
      _ -> []
    end)

    hwmpcf = Enum.map(hwmpc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth + h), lranks, lfiles}) end)

    hrppfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hrppc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight + hrppfp), lwidth, (lranks + hrppfp), lfiles}) do
      [{_, "r"}] -> hrppfp
      [{_, "n"}] -> hrppfp
      [{_, "b"}] -> hrppfp
      [{_, "k"}] -> hrppfp
      [{_, "q"}] -> hrppfp
      [{_, "p"}] -> hrppfp
      _ -> []
    end)

    hrppcf = Enum.map(hrppc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks + h), lfiles}) end)

    hrpmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hrpmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight + hrpmfp), lwidth, (lranks - hrpmfp), lfiles}) do
      [{_, "r"}] -> hrpmfp
      [{_, "n"}] -> hrpmfp
      [{_, "b"}] -> hrpmfp
      [{_, "k"}] -> hrpmfp
      [{_, "q"}] -> hrpmfp
      [{_, "p"}] -> hrpmfp
      _ -> []
    end)

    hrpmcf = Enum.map(hrpmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks - h), lfiles}) end)

    hrmmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hrmmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight - hrmmfp), lwidth, (lranks - hrmmfp), lfiles}) do
      [{_, "r"}] -> hrmmfp
      [{_, "n"}] -> hrmmfp
      [{_, "b"}] -> hrmmfp
      [{_, "k"}] -> hrmmfp
      [{_, "q"}] -> hrmmfp
      [{_, "p"}] -> hrmmfp
      _ -> []
    end)

    hrmmcf = Enum.map(hrmmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks - h), lfiles}) end)

    hrmpfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hrmpc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight - hrmpfp), lwidth, (lranks + hrmpfp), lfiles}) do
      [{_, "r"}] -> hrmpfp
      [{_, "n"}] -> hrmpfp
      [{_, "b"}] -> hrmpfp
      [{_, "k"}] -> hrmpfp
      [{_, "q"}] -> hrmpfp
      [{_, "p"}] -> hrmpfp
      _ -> []
    end)

    hrmpcf = Enum.map(hrmpc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks + h), lfiles}) end)

    hfppfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hfppc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight + hfppfp), lwidth, lranks, (lfiles + hfppfp)}) do
      [{_, "r"}] -> hfppfp
      [{_, "n"}] -> hfppfp
      [{_, "b"}] -> hfppfp
      [{_, "k"}] -> hfppfp
      [{_, "q"}] -> hfppfp
      [{_, "p"}] -> hfppfp
      _ -> []
    end)

    hfppcf = Enum.map(hfppc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles + h)}) end)

    hfpmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hfpmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight + hfpmfp), lwidth, lranks, (lfiles - hfpmfp)}) do
      [{_, "r"}] -> hfpmfp
      [{_, "n"}] -> hfpmfp
      [{_, "b"}] -> hfpmfp
      [{_, "k"}] -> hfpmfp
      [{_, "q"}] -> hfpmfp
      [{_, "p"}] -> hfpmfp
      _ -> []
    end)

    hfpmcf = Enum.map(hfpmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles - h)}) end)

    hfmmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hfmmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight - hfmmfp), lwidth, lranks, (lfiles - hfmmfp)}) do
      [{_, "r"}] -> hfmmfp
      [{_, "n"}] -> hfmmfp
      [{_, "b"}] -> hfmmfp
      [{_, "k"}] -> hfmmfp
      [{_, "q"}] -> hfmmfp
      [{_, "p"}] -> hfmmfp
      _ -> []
    end)

    hfmmcf = Enum.map(hfmmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles - h)}) end)

    hfmpfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hfmpc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight - hfmpfp), lwidth, lranks, (lfiles + hfmpfp)}) do
      [{_, "r"}] -> hfmpfp
      [{_, "n"}] -> hfmpfp
      [{_, "b"}] -> hfmpfp
      [{_, "k"}] -> hfmpfp
      [{_, "q"}] -> hfmpfp
      [{_, "p"}] -> hfmpfp
      _ -> []
    end)

    hfmpcf = Enum.map(hfmpc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles + h)}) end)

    wrppfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wrppc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + wrppfp), (lranks + wrppfp), lfiles}) do
      [{_, "r"}] -> wrppfp
      [{_, "n"}] -> wrppfp
      [{_, "b"}] -> wrppfp
      [{_, "k"}] -> wrppfp
      [{_, "q"}] -> wrppfp
      [{_, "p"}] -> wrppfp
      _ -> []
    end)

    wrppcf = Enum.map(wrppc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks + h), lfiles}) end)

    wrpmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wrpmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + wrpmfp), (lranks - wrpmfp), lfiles}) do
      [{_, "r"}] -> wrpmfp
      [{_, "n"}] -> wrpmfp
      [{_, "b"}] -> wrpmfp
      [{_, "k"}] -> wrpmfp
      [{_, "q"}] -> wrpmfp
      [{_, "p"}] -> wrpmfp
      _ -> []
    end)

    wrpmcf = Enum.map(wrpmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks - h), lfiles}) end)

    wrmmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wrmmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - wrmmfp), (lranks - wrmmfp), lfiles}) do
      [{_, "r"}] -> wrmmfp
      [{_, "n"}] -> wrmmfp
      [{_, "b"}] -> wrmmfp
      [{_, "k"}] -> wrmmfp
      [{_, "q"}] -> wrmmfp
      [{_, "p"}] -> wrmmfp
      _ -> []
    end)

    wrmmcf = Enum.map(wrmmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks - h), lfiles}) end)

    wrmpfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wrmpc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - wrmpfp), (lranks + wrmpfp), lfiles}) do
      [{_, "r"}] -> wrmpfp
      [{_, "n"}] -> wrmpfp
      [{_, "b"}] -> wrmpfp
      [{_, "k"}] -> wrmpfp
      [{_, "q"}] -> wrmpfp
      [{_, "p"}] -> wrmpfp
      _ -> []
    end)

    wrmpcf = Enum.map(wrmpc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks + h), lfiles}) end)

    wfppfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wfppc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + wfppfp), lranks, (lfiles + wfppfp)}) do
      [{_, "r"}] -> wfppfp
      [{_, "n"}] -> wfppfp
      [{_, "b"}] -> wfppfp
      [{_, "k"}] -> wfppfp
      [{_, "q"}] -> wfppfp
      [{_, "p"}] -> wfppfp
      _ -> []
    end)

    wfppcf = Enum.map(wfppc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles + h)}) end)

    wfpmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wfpmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + wfpmfp), lranks, (lfiles - wfpmfp)}) do
      [{_, "r"}] -> wfpmfp
      [{_, "n"}] -> wfpmfp
      [{_, "b"}] -> wfpmfp
      [{_, "k"}] -> wfpmfp
      [{_, "q"}] -> wfpmfp
      [{_, "p"}] -> wfpmfp
      _ -> []
    end)

    wfpmcf = Enum.map(wfpmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles - h)}) end)

    wfmmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wfmmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - wfmmfp), lranks, (lfiles - wfmmfp)}) do
      [{_, "r"}] -> wfmmfp
      [{_, "n"}] -> wfmmfp
      [{_, "b"}] -> wfmmfp
      [{_, "k"}] -> wfmmfp
      [{_, "q"}] -> wfmmfp
      [{_, "p"}] -> wfmmfp
      _ -> []
    end)

    wfmmcf = Enum.map(wfmmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles - h)}) end)

    wfmpfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wfmpc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - wfmpfp), lranks, (lfiles + wfmpfp)}) do
      [{_, "r"}] -> wfmpfp
      [{_, "n"}] -> wfmpfp
      [{_, "b"}] -> wfmpfp
      [{_, "k"}] -> wfmpfp
      [{_, "q"}] -> wfmpfp
      [{_, "p"}] -> wfmpfp
      _ -> []
    end)

    wfmpcf = Enum.map(wfmpc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles + h)}) end)

    rfppfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    rfppc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + rfppfp), (lfiles + rfppfp)}) do
      [{_, "r"}] -> rfppfp
      [{_, "n"}] -> rfppfp
      [{_, "b"}] -> rfppfp
      [{_, "k"}] -> rfppfp
      [{_, "q"}] -> rfppfp
      [{_, "p"}] -> rfppfp
      _ -> []
    end)

    rfppcf = Enum.map(rfppc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles + h)}) end)

    rfpmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    rfpmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - rfpmfp), (lfiles - rfpmfp)}) do
      [{_, "r"}] -> rfpmfp
      [{_, "n"}] -> rfpmfp
      [{_, "b"}] -> rfpmfp
      [{_, "k"}] -> rfpmfp
      [{_, "q"}] -> rfpmfp
      [{_, "p"}] -> rfpmfp
      _ -> []
    end)

    rfpmcf = Enum.map(rfpmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles - h)}) end)

    rfmmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    rfmmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - rfmmfp), (lfiles + rfmmfp)}) do
      [{_, "r"}] -> rfmmfp
      [{_, "n"}] -> rfmmfp
      [{_, "b"}] -> rfmmfp
      [{_, "k"}] -> rfmmfp
      [{_, "q"}] -> rfmmfp
      [{_, "p"}] -> rfmmfp
      _ -> []
    end)

    rfmmcf = Enum.map(rfmmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles + h)}) end)

    rfmpfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    rfmpc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + rfmpfp), (lfiles - rfmpfp)}) do
      [{_, "r"}] -> rfmpfp
      [{_, "n"}] -> rfmpfp
      [{_, "b"}] -> rfmpfp
      [{_, "k"}] -> rfmpfp
      [{_, "q"}] -> rfmpfp
      [{_, "p"}] -> rfmpfp
      _ -> []
    end)

    rfmpcf = Enum.map(rfmpc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles - h)}) end)

    b_capture_moves = (hwppcf ++ hwpmcf ++ hwmmcf ++ hwmpcf) ++ (hrppcf ++ hrpmcf ++ hrmmcf ++ hrmpcf) ++ (hfppcf ++ hfpmcf ++ hfmmcf ++ hfmpcf) ++ (wrppcf ++ wrpmcf ++ wrmmcf ++ wrmpcf) ++ (wfppcf ++ wfpmcf ++ wfmmcf ++ wfmpcf) ++ (rfppcf ++ rfpmcf ++ rfmmcf ++ rfmpcf)

    b_moves = b_empty_moves ++ b_capture_moves


    q_moves = rook_moves ++ b_moves


    if q_moves == [] do
      IO.puts("No valid moves for this piece, please select another!")
      Chesseract.Game.white_turn(%Chesseract.Board{positions: positions})
    else
      indexed_q_moves = Enum.with_index(q_moves)
      IO.inspect(indexed_q_moves)

      #To be replaced with UI
      user_int = IO.gets("Please input the integer corresponding to the move you would like to make:")
      |> String.trim()
      |> String.to_integer
      selected_move = Enum.at(q_moves, user_int)

      Chesseract.Helper.make_move(Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, lfiles}), selected_move, %Chesseract.Board{positions: positions})
      |> Chesseract.Game.black_turn()
    end
  end

  def bqmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
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



    hwpp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth + h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hwppf = Enum.map(hwpp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth + h), lranks, lfiles}) end)

    hwpm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth - h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hwpmf = Enum.map(hwpm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth - h), lranks, lfiles}) end)

    hwmm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth - h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hwmmf = Enum.map(hwmm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth - h), lranks, lfiles}) end)

    hwmp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth + h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hwmpf = Enum.map(hwmp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth + h), lranks, lfiles}) end)

    hrpp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hrppf = Enum.map(hrpp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks + h), lfiles}) end)

    hrpm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hrpmf = Enum.map(hrpm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks - h), lfiles}) end)

    hrmm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hrmmf = Enum.map(hrmm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks - h), lfiles}) end)

    hrmp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hrmpf = Enum.map(hrmp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks + h), lfiles}) end)

    hfpp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hfppf = Enum.map(hfpp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles + h)}) end)

    hfpm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hfpmf = Enum.map(hfpm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles - h)}) end)

    hfmm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hfmmf = Enum.map(hfmm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles - h)}) end)

    hfmp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    hfmpf = Enum.map(hfmp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles + h)}) end)

    wrpp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wrppf = Enum.map(wrpp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks + h), lfiles}) end)

    wrpm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wrpmf = Enum.map(wrpm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks - h), lfiles}) end)

    wrmm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wrmmf = Enum.map(wrmm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks - h), lfiles}) end)

    wrmp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wrmpf = Enum.map(wrmp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks + h), lfiles}) end)

    wfpp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wfppf = Enum.map(wfpp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles + h)}) end)

    wfpm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wfpmf = Enum.map(wfpm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles - h)}) end)

    wfmm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wfmmf = Enum.map(wfmm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles - h)}) end)

    wfmp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    wfmpf = Enum.map(wfmp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles + h)}) end)

    rfpp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    rfppf = Enum.map(rfpp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles + h)}) end)

    rfpm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    rfpmf = Enum.map(rfpm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles - h)}) end)

    rfmm = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    rfmmf = Enum.map(rfmm, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles - h)}) end)

    rfmp = Enum.take_while(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end)

    rfmpf = Enum.map(rfmp, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles + h)}) end)

    b_empty_moves = hwppf ++ hwpmf ++ hwmmf ++ hwmpf ++ hrppf ++ hrpmf ++ hrmmf ++ hrmpf ++ hfppf ++ hfpmf ++ hfmmf ++ hfmpf ++ wrppf ++ wrpmf ++ wrmmf ++ wrmpf ++ wfppf ++ wfpmf ++ wfmmf ++ wfmpf ++ rfppf ++ rfpmf ++ rfmmf ++ rfmpf







    hwppfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth + h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0) || 0


    hwppc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight + hwppfp), (lwidth + hwppfp), lranks, lfiles}) do
      [{_, "R"}] -> hwppfp
      [{_, "N"}] -> hwppfp
      [{_, "B"}] -> hwppfp
      [{_, "K"}] -> hwppfp
      [{_, "Q"}] -> hwppfp
      [{_, "P"}] -> hwppfp
      _ -> []
    end)

    hwppcf = Enum.map(hwppc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth + h), lranks, lfiles}) end)

    hwpmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth - h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hwpmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight + hwpmfp), (lwidth - hwpmfp), lranks, lfiles}) do
      [{_, "R"}] -> hwpmfp
      [{_, "N"}] -> hwpmfp
      [{_, "B"}] -> hwpmfp
      [{_, "K"}] -> hwpmfp
      [{_, "Q"}] -> hwpmfp
      [{_, "P"}] -> hwpmfp
      _ -> []
    end)

    hwpmcf = Enum.map(hwpmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), (lwidth - h), lranks, lfiles}) end)

    hwmmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth - h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hwmmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight - hwmmfp), (lwidth - hwmmfp), lranks, lfiles}) do
      [{_, "R"}] -> hwmmfp
      [{_, "N"}] -> hwmmfp
      [{_, "B"}] -> hwmmfp
      [{_, "K"}] -> hwmmfp
      [{_, "Q"}] -> hwmmfp
      [{_, "P"}] -> hwmmfp
      _ -> []
    end)

    hwmmcf = Enum.map(hwmmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth - h), lranks, lfiles}) end)

    hwmpfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth + h), lranks, lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hwmpc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight - hwmpfp), (lwidth + hwmpfp), lranks, lfiles}) do
      [{_, "R"}] -> hwmpfp
      [{_, "N"}] -> hwmpfp
      [{_, "B"}] -> hwmpfp
      [{_, "K"}] -> hwmpfp
      [{_, "Q"}] -> hwmpfp
      [{_, "P"}] -> hwmpfp
      _ -> []
    end)

    hwmpcf = Enum.map(hwmpc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), (lwidth + h), lranks, lfiles}) end)

    hrppfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hrppc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight + hrppfp), lwidth, (lranks + hrppfp), lfiles}) do
      [{_, "R"}] -> hrppfp
      [{_, "N"}] -> hrppfp
      [{_, "B"}] -> hrppfp
      [{_, "K"}] -> hrppfp
      [{_, "Q"}] -> hrppfp
      [{_, "P"}] -> hrppfp
      _ -> []
    end)

    hrppcf = Enum.map(hrppc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks + h), lfiles}) end)

    hrpmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hrpmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight + hrpmfp), lwidth, (lranks - hrpmfp), lfiles}) do
      [{_, "R"}] -> hrpmfp
      [{_, "N"}] -> hrpmfp
      [{_, "B"}] -> hrpmfp
      [{_, "K"}] -> hrpmfp
      [{_, "Q"}] -> hrpmfp
      [{_, "P"}] -> hrpmfp
      _ -> []
    end)

    hrpmcf = Enum.map(hrpmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, (lranks - h), lfiles}) end)

    hrmmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hrmmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight - hrmmfp), lwidth, (lranks - hrmmfp), lfiles}) do
      [{_, "R"}] -> hrmmfp
      [{_, "N"}] -> hrmmfp
      [{_, "B"}] -> hrmmfp
      [{_, "K"}] -> hrmmfp
      [{_, "Q"}] -> hrmmfp
      [{_, "P"}] -> hrmmfp
      _ -> []
    end)

    hrmmcf = Enum.map(hrmmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks - h), lfiles}) end)

    hrmpfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hrmpc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight - hrmpfp), lwidth, (lranks + hrmpfp), lfiles}) do
      [{_, "R"}] -> hrmpfp
      [{_, "N"}] -> hrmpfp
      [{_, "B"}] -> hrmpfp
      [{_, "K"}] -> hrmpfp
      [{_, "Q"}] -> hrmpfp
      [{_, "P"}] -> hrmpfp
      _ -> []
    end)

    hrmpcf = Enum.map(hrmpc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, (lranks + h), lfiles}) end)

    hfppfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hfppc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight + hfppfp), lwidth, lranks, (lfiles + hfppfp)}) do
      [{_, "R"}] -> hfppfp
      [{_, "N"}] -> hfppfp
      [{_, "B"}] -> hfppfp
      [{_, "K"}] -> hfppfp
      [{_, "Q"}] -> hfppfp
      [{_, "P"}] -> hfppfp
      _ -> []
    end)

    hfppcf = Enum.map(hfppc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles + h)}) end)

    hfpmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hfpmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight + hfpmfp), lwidth, lranks, (lfiles - hfpmfp)}) do
      [{_, "R"}] -> hfpmfp
      [{_, "N"}] -> hfpmfp
      [{_, "B"}] -> hfpmfp
      [{_, "K"}] -> hfpmfp
      [{_, "Q"}] -> hfpmfp
      [{_, "P"}] -> hfpmfp
      _ -> []
    end)

    hfpmcf = Enum.map(hfpmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight + h), lwidth, lranks, (lfiles - h)}) end)

    hfmmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hfmmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight - hfmmfp), lwidth, lranks, (lfiles - hfmmfp)}) do
      [{_, "R"}] -> hfmmfp
      [{_, "N"}] -> hfmmfp
      [{_, "B"}] -> hfmmfp
      [{_, "K"}] -> hfmmfp
      [{_, "Q"}] -> hfmmfp
      [{_, "P"}] -> hfmmfp
      _ -> []
    end)

    hfmmcf = Enum.map(hfmmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles - h)}) end)

    hfmpfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    hfmpc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions},
    {(lheight - hfmpfp), lwidth, lranks, (lfiles + hfmpfp)}) do
      [{_, "R"}] -> hfmpfp
      [{_, "N"}] -> hfmpfp
      [{_, "B"}] -> hfmpfp
      [{_, "K"}] -> hfmpfp
      [{_, "Q"}] -> hfmpfp
      [{_, "P"}] -> hfmpfp
      _ -> []
    end)

    hfmpcf = Enum.map(hfmpc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {(lheight - h), lwidth, lranks, (lfiles + h)}) end)

    wrppfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wrppc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + wrppfp), (lranks + wrppfp), lfiles}) do
      [{_, "R"}] -> wrppfp
      [{_, "N"}] -> wrppfp
      [{_, "B"}] -> wrppfp
      [{_, "K"}] -> wrppfp
      [{_, "Q"}] -> wrppfp
      [{_, "P"}] -> wrppfp
      _ -> []
    end)

    wrppcf = Enum.map(wrppc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks + h), lfiles}) end)

    wrpmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wrpmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + wrpmfp), (lranks - wrpmfp), lfiles}) do
      [{_, "R"}] -> wrpmfp
      [{_, "N"}] -> wrpmfp
      [{_, "B"}] -> wrpmfp
      [{_, "K"}] -> wrpmfp
      [{_, "Q"}] -> wrpmfp
      [{_, "P"}] -> wrpmfp
      _ -> []
    end)

    wrpmcf = Enum.map(wrpmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), (lranks - h), lfiles}) end)

    wrmmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks - h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wrmmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - wrmmfp), (lranks - wrmmfp), lfiles}) do
      [{_, "R"}] -> wrmmfp
      [{_, "N"}] -> wrmmfp
      [{_, "B"}] -> wrmmfp
      [{_, "K"}] -> wrmmfp
      [{_, "Q"}] -> wrmmfp
      [{_, "P"}] -> wrmmfp
      _ -> []
    end)

    wrmmcf = Enum.map(wrmmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks - h), lfiles}) end)

    wrmpfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks + h), lfiles}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wrmpc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - wrmpfp), (lranks + wrmpfp), lfiles}) do
      [{_, "R"}] -> wrmpfp
      [{_, "N"}] -> wrmpfp
      [{_, "B"}] -> wrmpfp
      [{_, "K"}] -> wrmpfp
      [{_, "Q"}] -> wrmpfp
      [{_, "P"}] -> wrmpfp
      _ -> []
    end)

    wrmpcf = Enum.map(wrmpc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), (lranks + h), lfiles}) end)

    wfppfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wfppc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + wfppfp), lranks, (lfiles + wfppfp)}) do
      [{_, "R"}] -> wfppfp
      [{_, "N"}] -> wfppfp
      [{_, "B"}] -> wfppfp
      [{_, "K"}] -> wfppfp
      [{_, "Q"}] -> wfppfp
      [{_, "P"}] -> wfppfp
      _ -> []
    end)

    wfppcf = Enum.map(wfppc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles + h)}) end)

    wfpmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wfpmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + wfpmfp), lranks, (lfiles - wfpmfp)}) do
      [{_, "R"}] -> wfpmfp
      [{_, "N"}] -> wfpmfp
      [{_, "B"}] -> wfpmfp
      [{_, "K"}] -> wfpmfp
      [{_, "Q"}] -> wfpmfp
      [{_, "P"}] -> wfpmfp
      _ -> []
    end)

    wfpmcf = Enum.map(wfpmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth + h), lranks, (lfiles - h)}) end)

    wfmmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wfmmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - wfmmfp), lranks, (lfiles - wfmmfp)}) do
      [{_, "R"}] -> wfmmfp
      [{_, "N"}] -> wfmmfp
      [{_, "B"}] -> wfmmfp
      [{_, "K"}] -> wfmmfp
      [{_, "Q"}] -> wfmmfp
      [{_, "P"}] -> wfmmfp
      _ -> []
    end)

    wfmmcf = Enum.map(wfmmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles - h)}) end)

    wfmpfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    wfmpc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - wfmpfp), lranks, (lfiles + wfmpfp)}) do
      [{_, "R"}] -> wfmpfp
      [{_, "N"}] -> wfmpfp
      [{_, "B"}] -> wfmpfp
      [{_, "K"}] -> wfmpfp
      [{_, "Q"}] -> wfmpfp
      [{_, "P"}] -> wfmpfp
      _ -> []
    end)

    wfmpcf = Enum.map(wfmpc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, (lwidth - h), lranks, (lfiles + h)}) end)

    rfppfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    rfppc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + rfppfp), (lfiles + rfppfp)}) do
      [{_, "R"}] -> rfppfp
      [{_, "N"}] -> rfppfp
      [{_, "B"}] -> rfppfp
      [{_, "K"}] -> rfppfp
      [{_, "Q"}] -> rfppfp
      [{_, "P"}] -> rfppfp
      _ -> []
    end)

    rfppcf = Enum.map(rfppc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles + h)}) end)

    rfpmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    rfpmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - rfpmfp), (lfiles - rfpmfp)}) do
      [{_, "R"}] -> rfpmfp
      [{_, "N"}] -> rfpmfp
      [{_, "B"}] -> rfpmfp
      [{_, "K"}] -> rfpmfp
      [{_, "Q"}] -> rfpmfp
      [{_, "P"}] -> rfpmfp
      _ -> []
    end)

    rfpmcf = Enum.map(rfpmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles - h)}) end)

    rfmmfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles + h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    rfmmc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - rfmmfp), (lfiles + rfmmfp)}) do
      [{_, "R"}] -> rfmmfp
      [{_, "N"}] -> rfmmfp
      [{_, "B"}] -> rfmmfp
      [{_, "K"}] -> rfmmfp
      [{_, "Q"}] -> rfmmfp
      [{_, "P"}] -> rfmmfp
      _ -> []
    end)

    rfmmcf = Enum.map(rfmmc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks - h), (lfiles + h)}) end)

    rfmpfp = Enum.at(Enum.filter(1..7, fn h ->
      case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles - h)}) do
        [{_, nil}] -> true
        _ -> false
      end
    end), 0)  || 0

    rfmpc = (case Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + rfmpfp), (lfiles - rfmpfp)}) do
      [{_, "R"}] -> rfmpfp
      [{_, "N"}] -> rfmpfp
      [{_, "B"}] -> rfmpfp
      [{_, "K"}] -> rfmpfp
      [{_, "Q"}] -> rfmpfp
      [{_, "P"}] -> rfmpfp
      _ -> []
    end)

    rfmpcf = Enum.map(rfmpc, fn h -> Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, (lranks + h), (lfiles - h)}) end)

    b_capture_moves = (hwppcf ++ hwpmcf ++ hwmmcf ++ hwmpcf) ++ (hrppcf ++ hrpmcf ++ hrmmcf ++ hrmpcf) ++ (hfppcf ++ hfpmcf ++ hfmmcf ++ hfmpcf) ++ (wrppcf ++ wrpmcf ++ wrmmcf ++ wrmpcf) ++ (wfppcf ++ wfpmcf ++ wfmmcf ++ wfmpcf) ++ (rfppcf ++ rfpmcf ++ rfmmcf ++ rfmpcf)

    b_moves = b_empty_moves ++ b_capture_moves

    q_moves = b_moves ++ rook_moves



    if q_moves == [] do
      IO.puts("No valid moves for this piece, please select another!")
      Chesseract.Game.black_turn(%Chesseract.Board{positions: positions})
    else
      indexed_q_moves = Enum.with_index(q_moves)
      IO.inspect(indexed_q_moves)

      #To be replaced with UI
      user_int = IO.gets("Please input the integer corresponding to the move you would like to make:")
      |> String.trim()
      |> String.to_integer
      selected_move = Enum.at(q_moves, user_int)

      Chesseract.Helper.make_move(Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, lfiles}), selected_move, %Chesseract.Board{positions: positions})
      |> Chesseract.Game.white_turn()
    end
  end

end

defmodule Chessess.Pieces.Pawn do


  def wpmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    placeholder = Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, lfiles})
    if placeholder == [] do
      :ok
    end
  end

  def bpmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    placeholder = Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, lfiles})
    if placeholder == [] do
      :ok
    end
  end


end

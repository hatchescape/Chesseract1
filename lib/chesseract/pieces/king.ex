defmodule Chesseract.Pieces.King do


  def wkmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    placeholder = Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, lfiles})
    if placeholder == [] do
      :ok
    end
  end

  def bkmoves(lheight, lwidth, lranks, lfiles, %Chesseract.Board{positions: positions}) do
    placeholder = Chesseract.Helper.find_coord(%Chesseract.Board{positions: positions}, {lheight, lwidth, lranks, lfiles})
    if placeholder == [] do
      Chesseract.Helper.give_value(placeholder)
    end
  end



end

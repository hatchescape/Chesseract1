defmodule Chesseract.Helper do

  def find_coord(%Chesseract.Board{positions: positions}, input) do
    {lheight, lwidth, lranks, lfiles} = input

    Enum.filter(positions, fn {key, _value} ->
       key == :"H#{lheight},W#{lwidth},R#{lranks},F#{lfiles}"
    end)
  end

  def give_value(input) do
     {_, value} = input
     value
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

    %Chesseract.Board{positions: new_positions}
  end

end

defmodule Chesseract do
  @moduledoc """
  Documentation for `Chesseract`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chesseract.hello()
      :world

  """
  def run do
    Chesseract.Board.new() |>
    Chesseract.Game.white_turn()
    # game = Game.new() # prompt the user for the board dimensions
    # create the board and return it as part of the game object
    # create the player1 object, player2 objects with their move history
    # game.start() # start the clock, request player moves
  end
end

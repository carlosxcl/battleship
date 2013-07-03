require 'board'


class Player
  attr :ships
  def initialize(board)
   @board = board
   @board.set_board
   @ships = []
   add_ships
 end

  def view_board
    @board
  end

  def add_ships
    @ships << "Carrier" << "Patrol" << "Destroyer" << "Submarine" << "Battleship"
  end

  def place_ship(coordinates, ship)
    if @ships.include? ship.type
      @board.add_boat(coordinates, ship)
      @ships.delete(ship.type)
    else
      raise "You dont have anymore #{ship.type} ships"
    end
  end

end
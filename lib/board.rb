require 'boats'
class Board
attr :board
  attr :size, :grid
  def initialize
    @grid = Hash.new
    @num_array = []
    @letter_array = []
  end

  def set_board
    grid_array = []
    ('a'..'j').each do |l|
      (1..10).each do |n|
        grid_array << "#{l}#{n}"
      end
    end
    grid_array.each do |co|
      co_sym = co.to_sym
      @grid[co_sym] = 0
    end
  end

  def check_cell(coordinate)
   @grid[coordinate]
  end

  def hit(coordinate)
    @grid[coordinate] = "x"
  end

  def add_boat(coordinates, boat)
    if !test_neighbors(coordinates)
      coordinates.each do |co|
        @grid[co] = boat
      end
    else
      raise "Your boat is broken!"
    end
  end

  def test_neighbors(coordinates)
    new_coordinates = coordinates.dup
    while new_coordinates.length != 0
      cell1 = new_coordinates[new_coordinates.length-1]
      cell2 = new_coordinates[new_coordinates.length-2]
      raise "error" if  !neighbour?(cell1,cell2)
      new_coordinates.pop
    end
  end

  def neighbour?(cell1,cell2) # :a1 b1
    cell1_x = cell1.to_s.byteslice(0).bytes[0]
    cell2_x = cell2.to_s.byteslice(0).bytes[0]
    cell1_n = cell1.to_s.byteslice(1).to_i
    cell2_n = cell2.to_s.byteslice(1).to_i
#    if ((cell1_x - cell2_x).abs <= 1 || (cell2_x - cell1_x).abs <= 1) && ((cell1_n - cell2_n).abs <= 1 || (cell2_n - cell1_n).abs <= 1)
    if compare_dir(cell1_x,cell2_x)  && compare_dir(cell1_n,cell2_n)
      true
    else
      false
    end
  end

  def compare_dir(cell1, cell2)
    (cell1 - cell2).abs <= 1 || (cell2 - cell1).abs <= 1
  end
end






class OpBoard

  def initialize board
    @board = board
  end

def check_cell(coordinate)
  cell = @board.grid[coordinate]

  if cell != 0
    return "x" if cell.hit?(coordinate)
  else
    @board.grid[coordinate]
  end
  end

end

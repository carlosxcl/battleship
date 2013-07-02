class Board

attr :board
  attr :size, :board
  def initialize
    @board = []
    @num_array = []
    @letter_array = []
  end
  def set_board_array
    @board = ('a'..'j').map do |l|
      (1..10).map do |n|
      "#{n}#{l}".split
      end
    end
  end

  def board
    @board
  end


end
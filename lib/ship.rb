class Ship
  attr :sunk, :type, :state, :length, :coord
  def initialize(type = "Default")
    @sunk = false
    @type = type
    @length = 0
    @state = []
    @coord = []
  end

  def sunk?
    sunk
  end

  def sink
   @sunk = true
  end

  def type_length(type)
    @type_length[type]
  end

  def hit?(coordinate)
    @state[0].include?(coordinate)
  end

  def hit(coordinate)
    position = @state[0].index(coordinate)
    @state[position][1] = 0
  end


  def set_coord_array(*args)
    args.each{|co| @coord << [co,1] }
  end
  def set_state_array
    @state = @coord
  end


end

class Carrier < Ship

  @hit = [0,0,0,0,0]
  @state = []

  def initialize
    super
    @length = 5
  end


end




# @type_length = {
#       "Carrier" => [0,0,0,0,0] ,
#       "Battleship" => [0,0,0,0] ,
#       "Submarine" => [0,0,0] ,
#       "Destroyer" => [0,0,0] ,
#       "Patrol" => [0,0],
#       "Default" => [0]}
















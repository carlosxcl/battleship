class Ship
  attr :sunk, :type, :state
  def initialize(type = "Default")
    @sunk = false
    @type = type
    @state = [] #ship_array(type)
    @type_length = {
      "Carrier" => [0,0,0,0,0] ,
      "Battleship" => [0,0,0,0] ,
      "Submarine" => [0,0,0] ,
      "Destroyer" => [0,0,0] ,
      "Patrol" => [0,0],
      "Default" => [0]}
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

  def length(type)
    @type_length[type].length
  end

  def ship_array(type)
    @type_length[type]
  end

  def set_state
    @state = ship_array(type)
  end

  def hit(index)
    @state[index] = 1
    if !@state.include? 0
     sink
    end
  end

end
class Ship
  attr :sunk, :type, :state, :length, :coord
  def initialize
    @sunk = false
    @type = type
    @length = 0
    @state = Hash.new
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
    if @state[coordinate]
      true
    end
  end

  def hit(coordinate)
    @state[coordinate] = 0
    if !@state.has_value?(1)
      sink
    end
  end

  def set_coord_array(*args)
    args.each{|co| @coord << co }
  end

  def set_state_array(*args)
    args.each do|co|
      @state[co] = 1
    end
  end

end

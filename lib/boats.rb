require 'ship'

class Carrier < Ship
  def initialize
    super
    @length = 5
    @Type = self.class.name
  end
end

class Battleship < Ship
  def initialize
    super
    @length = 4
    @Type = self.class.name
  end
end

class Submarine < Ship
  def initialize
    super
    @length = 3
    @Type = self.class.name
  end
end

class Destroyer < Ship
  def initialize
    super
    @length = 3
    @Type = self.class.name
  end
end

class Patrol < Ship
  def initialize
    super
    @length = 2
    @type = self.class.name
  end
end

require 'ship'

describe Ship do
  let (:ship) {Ship.new}

  it "should return false to sunk?" do
    expect(ship.sunk?).to be_false
  end

  it "should be sinkable" do
    ship.sink
    expect(ship.sunk?).to be_true
  end

  it "should have a type_length" do
    expect(ship.type_length(ship.type)).not_to be nil
  end

  it "a battleship should have a lenght of 4" do
    expect(ship.length("Battleship")).to eq 4
  end

  it "a battelship should have an array named state" do
    expect(ship.state).to be_an Array
  end

  it "can have its state set to unexploded" do
    ship = Ship.new("Battleship")
    ship.set_state
    expect(ship.state).to eq [0,0,0,0]
  end

  it "can change its state to hit" do
    ship = Ship.new("Battleship")
    ship.set_state
    ship.hit(0)
    expect(ship.state).to eq [1,0,0,0]
  end

  it "if all parts are hit, it should sink" do
    ship = Ship.new("Battleship")
    ship.set_state
    ship.hit(0)
    ship.hit(1)
    ship.hit(2)
    ship.hit(3)
    expect(ship.sunk?).to be_true
  end

end

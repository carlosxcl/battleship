require 'ship'

describe Ship do
  let (:ship) {Ship.new}
  let (:carrier) {Carrier.new}

  it "should return false to sunk?" do
    expect(ship.sunk?).to be_false
  end

  it "should be sinkable" do
    ship.sink
    expect(ship.sunk?).to be_true
  end

  it "should have a length" do
    expect(carrier.length).not_to be nil
  end

  it "a carrier should have a lenght of 5" do
    expect(carrier.length).to eq 5
  end

  it "a battelship should have an array named state" do
    expect(ship.state).to be_an Array
  end

  it 'can have a default state set' do
    carrier.set_coord_array("a1","a2","a3","a4","a5")
    carrier.set_state_array
    #puts carrier.state.inspect
    expect(carrier.coord).to eq [["a1",1],["a2",1],["a3",1],["a4",1],["a5",1]]
  end

  it "can recognise a hit" do
    carrier.set_coord_array("a1","a2","a3","a4","a5")
    carrier.set_state_array
    expect(carrier.hit?("a1")).to be_true
    #expect(carrier.coord).to eq [["a1",0],["a2",1],["a3",1],["a4",1],["a5",1]]
  end

  it "can set a ship bit to hit" do
    carrier.set_coord_array("a1","a2","a3","a4","a5")
    carrier.set_state_array
    carrier.hit("a1")
    #puts carrier.state.inspect
    expect(carrier.state).to eq [["a1",0],["a2",1],["a3",1],["a4",1],["a5",1]]
  end


  xit "if all parts are hit, it should sink" do
    ship = Ship.new("Battleship")
    ship.set_state
    ship.hit(0)
    ship.hit(1)
    ship.hit(2)
    ship.hit(3)
    expect(ship.sunk?).to be_true
  end

  # xit "can be given coordinates" do
  #   ship = Ship.new("Battleship")
  #   ship.set_state
  #   ship.



end

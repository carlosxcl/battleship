require 'boats'


describe Ship do
  let (:ship) {Ship.new}
  let (:carrier) {Carrier.new}
  let (:patrol) {Patrol.new}

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
    expect(ship.state).to be_an Hash
  end

  it 'can have a default state set' do
    carrier.set_state_array(:a1,:a2,:a3,:a4,:a5)
    #puts carrier.state.inspect
    expect(carrier.state).to eq ({:a1=>1, :a2=>1, :a3=>1, :a4=>1, :a5=>1})
  end

  it "can recognise a hit" do
    carrier.set_state_array(:a1,:a2,:a3,:a4,:a5)
    carrier.hit(:a1)
    expect(carrier.hit?(:a1)).to be_true
    #expect(carrier.coord).to eq [["a1",0],["a2",1],["a3",1],["a4",1],["a5",1]]
  end

  it "can set a ship bit to hit" do
    carrier.set_state_array(:a1,:a2,:a3,:a4,:a5)
    carrier.hit(:a1)
    carrier.hit(:a2)
    expect(carrier.state).to eq ({:a1=>0, :a2=>0, :a3=>1, :a4=>1, :a5=>1})
  end


  it "if all parts are hit, it should sink" do
    carrier.set_state_array(:a1,:a2,:a3,:a4,:a5)
    carrier.hit(:a1)
    carrier.hit(:a2)
    carrier.hit(:a3)
    carrier.hit(:a4)
    carrier.hit(:a5)
    #puts carrier.state.inspect
    expect(carrier.sunk?).to be_true
  end

  it "if all parts are hit, it should sink" do
    patrol.set_state_array(:a4,:a5)
    patrol.hit(:a4)
    patrol.hit(:a5)
    #puts carrier.state.inspect
    expect(patrol.sunk?).to be_true
  end

end

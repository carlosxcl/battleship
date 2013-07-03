require 'player'

describe Player do
  let(:board){Board.new}
  let(:player){Player.new(board)}
  let(:patrol){Patrol.new}

  it 'should be able to see their board' do
    expect(player.view_board).to be_an Board
  end

  it 'should have 5 boats 1 of each type' do
    expect(player.ships.length).to eq 5
  end

  it 'can position a Patrol boat' do
    player.place_ship([:a1,:a2],patrol)
    expect(board.check_cell(:a1)).to be_a Patrol
  end

  it 'raises an error if you dont have anymore of a type of ship' do
    player.place_ship([:a1,:a2],patrol)
    expect{player.place_ship([:a1,:a2],patrol)}.to raise_error "You dont have anymore Patrol ships"
  end



end
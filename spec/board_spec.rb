require 'board'

describe Board do
  let (:board) {Board.new}
  let (:opboard) {OpBoard.new(board)}
  let (:patrol) {Patrol.new}

  it "is a hash" do
    expect(board.grid).to be_a Hash
  end

  it "will return an array of 100 count" do
    board.set_board
    expect(board.grid.count).to eq 100
  end

  it "should be able check cell status" do
    board.set_board
    expect(board.check_cell(:a1)).to eq 0
  end

  it "should be able to take a hit" do
    board.set_board
    board.hit(:a1)
#    puts board.grid
    expect(board.check_cell(:a1)).to eq "x"
  end

  it "should be able to accept a boat" do
    board.set_board
    board.add_boat([:a1,:a2],patrol)
    #puts puts board.grid
    expect(board.check_cell(:a1)).to eq patrol
  end

  it 'a boat on the board should be able to be hit' do
     board.set_board
     board.add_boat([:a1,:a2],patrol)
     patrol.set_coord_array(:a1,:a2)
     patrol.set_state_array
     patrol.hit(:a1)
     # puts patrol.state
     # puts patrol.hit?(:a1)
     expect(patrol.hit?(:a1)).to be_true
  end

  it 'can hide a boat from an opponent' do
     board.set_board
     board.add_boat([:a1,:a2],patrol)
     patrol.set_coord_array(:a1,:a2)
     patrol.set_state_array
     patrol.hit(:a1)
     # puts opboard.check_cell(:a1).inspect
     expect(opboard.check_cell(:a1)).to eq "x"
  end


  it 'can test direction' do
    expect(board.compare_dir(1,3)).to be_false
  end

  it 'can test direction' do
    expect(board.compare_dir(1,1)).to be_true
  end

  it 'can test for an up down neighbouring cell' do
     board.set_board
     expect(board.neighbour?(:a1,:b1)).to be_true
  end

  it 'can test for an left right non neighbouring cell' do
     board.set_board
     expect(board.neighbour?(:a1,:a3)).to be_false
  end

  it 'can test for an left right neighbouring cell' do
     board.set_board
     expect(board.neighbour?(:a1,:a3)).to be_false
  end

  xit "will not accept an L shape ship" do

  end

  it "it can identify neighbors from a set of coordinates" do
     expect{board.test_neighbors([:a1,:c2,:a3,:a4])}.to raise_error
  end

  it 'can only place a ship on neighbouring cells' do
    board.set_board
    expect{board.add_boat([:a1,:a3],patrol)}.to raise_error
  end


end
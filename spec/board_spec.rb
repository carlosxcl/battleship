require 'board'

describe Board do
  let (:board) {Board.new}

  it "is a array" do
    expect(board.board).to be_an Array
  end

  it "will return an array of 100 in length" do
    board.set_board_array
    #puts board.board.inspect
    expect(board.board.length).to eq 10
  end

end
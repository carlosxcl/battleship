require 'board'

describe Board do
  let (:threeboard) {Board.new(3)}

it "is a array" do
expect(threeboard.board).to be_an Array
end

it "will return an array of n squared 2 in length" do
expect(threeboard.board.length).to eq 9
end


end
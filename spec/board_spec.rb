require "./lib/board"

RSpec.describe Board do
    describe "#initialize" do
        it "has a 6x7 grid with nil values" do
            board = Board.new(nil)
            expect(board.rows[0].size).to eq(7)
            expect(board.rows.size).to eq(6)
            expect(board.rows.all? { |row| row.all? { |cell| cell.val.nil? } }).to eq(true)
        end

        it "initializes with default values" do
            board = Board.new("O")
            expect(board.rows[0].size).to eq(7)
            expect(board.rows.size).to eq(6)
            expect(board.rows.all? { |row| row.all? { |cell| cell.val == "O" } }).to eq(true)
        end
    end

    describe "#win?" do
        it "returns false if there is no win" do
            board = Board.new
            board.make_move(3, "*")
            expect(board.win?(3, "*")).to eq(false)
        end

        it "returns true if there is a win" do
            board = Board.new
            4.times { board.make_move(1,"*")}
            expect(board.win?(1, "*")).to eq(true)
        end
    end

    describe "#valid_move?" do
        it "returns true if input is 1-7 and there is an open spot" do
            board = Board.new
            expect(board.valid_move?(1)).to eq(true)
        end

        it "returns false if spot is off board" do
            board = Board.new
            expect(board.valid_move?(-1)).to eq(false)
        end

        it "returns false if column is full" do
            board = Board.new
            6.times { board.make_move(3, "$") }
            expect(board.valid_move?(3)).to eq(false)
        end

    end

    describe "#make_move" do
        it "replaces value in cell with player's marker" do
            board = Board.new
            board.make_move(0, "X")
            expect(board.rows[5][0].val).to eq("X")
        end
    end
end
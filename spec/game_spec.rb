require "./lib/game"

RSpec.describe Game do
    describe "#initialize" do
        it "has two players" do
            p1 = Player.new("Billy", "X")
            p2 = Player.new("William", "O")

            game = Game.new(p1, p2)
            expect(game.players).to eq(["Billy", "William"])
        end

        it "defaults the first player as 'active'" do
            p1 = Player.new("Billy", "X")
            p2 = Player.new("William", "O")

            game = Game.new(p1, p2)
            expect(game.active_player).to eq("Billy")
        end
    end
    
    describe "#intro" do
        it "does not raise error" do
            p1 = Player.new("Billy", "X")
            p2 = Player.new("William", "O")

            game = Game.new(p1, p2)
            expect(game.intro).not_to raise_error
        end
    end

    describe "#play" do
        it "concludes when there is a winner" do
            
        end
    end

    describe "#illicit_move" do
        it "retries if an invalid move is made" do
            
        end

        it "makes move if a valid move is provided" do
            
        end
    end

    describe "#switch_active_player" do
        it "makes the other player active if they aren't" do
            p1 = Player.new("Billy", "X")
            p2 = Player.new("William", "O")

            game = Game.new(p1, p2)
            game.switch_active_player
            expect(game.active_player).to eq("William")
        end
    end
end
require "./lib/player.rb"

RSpec.describe Player do
    describe "initialize" do
        it "player has a name and marker" do
            player = Player.new("Billy", "X")
            expect(player.to_s).to eq("Billy's marker is X")
        end
    end
end
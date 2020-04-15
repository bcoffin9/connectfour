require "./lib/cell.rb"

RSpec.describe Cell do
    describe "#initialize" do
        it "Cell has a value" do
            cell = Cell.new("Val")
            expect(cell.val).to eq("Val")
        end
    end
end
describe Game do
  subject(:game) { described_class.new }
  let(:player) { double(:player) }

  describe "#attack" do
    it "invokes the #take_damage method on the argument" do
      expect(player).to receive(:take_damage)
      game.attack(player)
    end
  end
end

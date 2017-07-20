describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double(:player_1) }
  let(:player_2) { double(:player_2) }

  describe "#initialize" do
    it 'stores instances of active players' do
      expect(game.players).to include(player_1, player_2)
    end
  end

  describe "#attack" do
    it "invokes the #take_damage method on the argument" do
      expect(player_2).to receive(:take_damage)
      game.attack(player_2)
    end
  end
end

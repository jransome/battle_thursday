describe Game do
  subject(:game) { Game.instance }
  let(:player_1) { double(:player_1, take_damage: nil) }
  let(:player_2) { double(:player_2, take_damage: nil) }

  before do
    game.add_players(player_1, player_2)
  end

  describe '#add_players' do
    it 'stores instances of active players' do
      expect(game.players).to include(player_1, player_2)
    end
  end

  describe "#attack" do
    it "invokes the #take_damage method" do
      expect(player_2).to receive(:take_damage)
      game.attack
    end
  end

  describe "#player_1_turn" do
    it "returns true at the start of the game" do
      expect(game.player_1_turn).to be true
    end

    it "returns false after player 1 has taken a turn" do
      game.switch_turn
      expect(game.player_1_turn).to be false
    end
  end

  context 'one player has <= 0 hp' do
    it 'ends the game' do
      allow(player_2).to receive(:dead?) { true }
      game.attack
      expect(game).to be_ended
    end
  end
end

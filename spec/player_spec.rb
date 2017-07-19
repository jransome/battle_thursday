describe Player do
  let(:player_name) { 'James' }
  subject(:player) { Player.new(player_name) }
  it 'should return the name' do
    expect(player.name).to eq player_name
  end
end

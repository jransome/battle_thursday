describe Player do

  let(:name) { 'James' }
  subject(:player) { described_class.new(name) }

  it 'should return the name' do
    expect(player.name).to eq name
  end

  it 'should know if is dead' do
    player.take_damage(Player::DEFAULT_HP)
    expect(player.dead?).to eq true
  end

end

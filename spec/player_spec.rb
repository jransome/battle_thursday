describe Player do

  let(:name) { 'James' }
  subject(:player) { described_class.new(name) }

  it 'should return the name' do
    expect(player.name).to eq name
  end


end

class Game

  DEFAULT_ATTACK = 10
  attr_reader :players

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
  end

  def attack(player)
    player.take_damage(DEFAULT_ATTACK)
  end

end

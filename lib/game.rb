class Game

  DEFAULT_ATTACK = 10

  def attack(player)
    player.take_damage(DEFAULT_ATTACK)
  end

end

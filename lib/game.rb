class Game

  DEFAULT_ATTACK = 10
  attr_reader :attacker, :defender, :players, :player_1_turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @attacker = player_1
    @defender = player_2
    @player_1_turn = true
  end

  def attack
    @defender.take_damage(DEFAULT_ATTACK)
  end

  def attack_confirmation(last_move)
    return "#{@attacker.name} has attacked #{@defender.name}" unless last_move.nil?
    ""
  end

  def turn
    "It's #{@attacker.name}'s turn"
  end

  def switch_turn
    @player_1_turn = !@player_1_turn
    switch_attacker_defender
  end

  def ended?
    @defender.dead?
  end

  private

  def switch_attacker_defender
    @attacker, @defender = @defender, @attacker
  end
end

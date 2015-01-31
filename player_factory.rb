require_relative 'player'
require_relative 'ai_player'

class PlayerFactory
  
  def create_player(name, ruleset)
    @name = name
    if ai_player_check
      new_player = AI_Player.new(ruleset)
    else
      new_player = Player.new(name)
    end
    new_player
  end
  
  def ai_player_check
    @name == "ai_player"
  end
  
end
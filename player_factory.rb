require_relative 'player'

# Class: PlayerFactory
#
# In charge of creating player objects and determining which one to create
#
# Attributes:
# None
#
# Public Methods:
# #create_player

class PlayerFactory
  
  # Public: #create_player
  # Creates a new player object based on name parameter.
  #
  # Parameters:
  # name    - String: name of the object to be created
  # ruleset - Object: object belonging to either RPSRules or RPSLSRules
  #
  # Returns:
  # new_player: the created Player or AI_Player object.
  #
  # State Changes:
  # None
  
  def create_player(name, ruleset)
    if name == "ai_player"
      new_player = AI_Player.new(ruleset)
    else
      new_player = Player.new(name)
    end
    new_player
  end
  
end
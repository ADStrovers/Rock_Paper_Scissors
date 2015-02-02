require_relative 'player_factory'
require_relative 'game'
require 'pry'

# Class: Driver
#
# Responsible for the creation of the game and players and printing the results of the game.
#
# Attributes:
# None
#
# Public Methods:
# None

class GameDriver
  
  # Private: #start_game
  # In charge of creating other objects and passing them into the game.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # None
  
  def start_game
    game_type = get_game_type
    player1 = get_player
    player2 = get_player
    factory = PlayerFactory.new
    
    game = Game.new(@rules, player1, player2)
    game.play
  end
  
  private
  
  # Private: #get_player
  # In charge of getting input and passing input to set_player
  #
  # Returns:
  # New Player or AI_Player object
  #
  # State Changes:
  # None
  
  def get_player
    puts "Enter 1 to add human player. \nEnter 2 to add AI player."
    player_type = gets.chomp
    set_player(player_type)
  end
  
  # Private: #get_player
  # Takes input and creates new Player or AI_Player based on value
  #
  # Parameters:
  # player_type - String: 1 if human, 2 if ai.
  #
  # Returns:
  # New Player or AI_Player object
  #
  # State Changes:
  # None - all local variables.
  
  def set_player(player_type)
    case player_type
    when "1"
      player = Player.new(gets.chomp)
      player.set_name
    when "2"
      player = AI_Player.new(@rules)
      player.set_name
    else
      get_player
    end
    player
  end
      
  # Private: #get_game_type
  # Receives input and passes to set_game_type
  #
  # Returns:
  # nil
  #
  # State Changes:
  # None
  
  def get_game_type
    puts "Please select from the following list:\n1. Rock, Paper, Scissors\n2. Rock, Paper, Scissors, Lizard, Spock"
    input = gets.chomp
    set_game_type(input)
  end
  
  # Private: #set_game_type
  # Takes input and sets @rules to either RPSRUles or RPSLSRules
  #
  # Parameters:
  # input - String: "1" if RPS, "2" if RPSLS
  #
  # Returns:
  # nil
  #
  # State Changes:
  # @rules
  
  def set_game_type(input)
    case input
    when "1"
      @rules = RPSRules.new
    when "2"
      @rules = RPSLSRules.new
    else
      get_game_type
    end
  end
  
end

binding.pry
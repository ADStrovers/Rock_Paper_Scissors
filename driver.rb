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
  def initialize(player1 = "ai_player", player2 = "ai_player")
    start_rps(player1, player2)
  end
  
  private
  
  # Private: #play
  # In charge of creating other objects and passing them into the game.
  #
  # Parameters:
  # name1 - String: Name of the first player class to be made.
  # name2 - String: Name of the second player class to be made.
  #
  # Returns:
  # An emptry string.
  #
  # State Changes:
  # None
  
  def start_rps(name1, name2)
    factory = PlayerFactory.new
    rules = RPSRules.new
    player1 = factory.create_player(name1, rules)
    player2 = factory.create_player(name2, rules)
    rps_game = Game.new(rules, player1, player2)
    @winner = rps_game.play_rps
    print_results
  end
  
  # Private: #play
  # Responsible for printing the winner of the game
  #
  # Parameters:
  # None
  #
  # Returns:
  # nil
  #
  # State Changes:
  # None
  
  def print_results
    puts "Congrats #{@winner}!  You won the game!"
  end
end

binding.pry
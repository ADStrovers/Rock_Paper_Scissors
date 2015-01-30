require_relative 'player'
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
  def initialize(*players)
    start_rps(players[0], players[1])
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
    rules = RPSRules.new
    player1 = Player.new(name1)
    player2 = Player.new(name2)
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
require_relative 'player'
require_relative 'game'
require 'pry'

# Class: Driver
#
# Responsible for the creation of the game and players and printing the results of the game.
#
# Attributes:
# @winner   - String: Holds the name of the winning object
#
# Public Methods:
# #start_rps

class GameDriver
  def initialize(*players)
    start_rps(players[0], players[1])
  end
  
  def start_rps(name1, name2)
    rules = RPSRules.new
    player1 = Player.new(name1)
    player2 = Player.new(name2)
    rps_game = Game.new(rules, player1, player2)
    @winner = rps_game.play_rps
    print_results
  end
  
  private
  
  def print_results
    puts "Congrats #{@winner}!  You won the game!"
  end
end

binding.pry
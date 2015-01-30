require_relative 'driver'
require_relative 'game'

# Class: Player
#
# Models each player within the game
#
# Attributes:
# @name   - String: the player's name.
# @move   - String: the move the player is using
# @score  - Integer: the number of times the player has won in the current series
#
# Public Methods:
# None yet.

class Player
  attr_reader :name
  attr_accessor :move, :score
  
  def initialize(name)
    @name = name
    @move = ""
    @score = 0
  end
end
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
  attr_reader :name, :score
  attr_accessor :won, :move
  
  def initialize(name)
    @name = name
    @move = ""
    @score = 0
    @won = false
  end
  
  def increase_score(inc = 1)
    @score += 1
  end
  
  def get_move
    print "#{@name}, please give me your move: "
    @move = gets.chomp.capitalize
  end
  
end
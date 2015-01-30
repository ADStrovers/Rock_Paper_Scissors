# Class: Player
#
# Models each player within the game
#
# Attributes:
# @name   - String: the player's name.
# @move   - String: the move the player is using
# @score  - Integer: the number of times the player has won in the current series
# @won    - Boolean: returns true or false if the player has reached the win conditions
#
# Public Methods:
# #increase_score
# #get_move

class Player
  attr_reader :name, :score
  attr_accessor :won, :move
  
  def initialize(name)
    @name = name
    @move = ""
    @score = 0
    @won = false
  end
  
  # Public: #increase_score
  # Increments @score by given number.  If not provided defaults to 1
  #
  # Parameters:
  # inc - Integer
  #
  # Returns:
  # Player: Whoever was victorious.
  #
  # State Changes:
  # Sets @winning_player and @losing_player.
  
  def increase_score(inc = 1)
    @score += inc.to_i
  end
  
  # Public: #get_move
  # Prompts for a string and sets @move to that string.
  #
  # Parameters:
  #
  # Returns:
  # @move
  #
  # State Changes:
  # @move
  
  def get_move
    print "#{@name}, please give me your move: "
    @move = gets.chomp.capitalize
  end
  
end
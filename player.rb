module Shared_Player_Methods
  
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
  
end

# Class: Player
#
# Models a human player within the game
#
# Attributes:
# @name   - String: the player's name.
# @move   - String: the move the player is using
# @score  - Integer: the number of times the player has won in the current series
# @won    - Boolean: returns true or false if the player has reached the win conditions
#
# Public Methods:
# #increase_score
# #set_name
# #get_move

class Player
  attr_reader :name, :score
  attr_accessor :won, :move
  
  include Shared_Player_Methods
  
  def initialize(name)
    @name = name
    @move = ""
    @score = 0
    @won = false
  end
  
  # Public: #set_name
  # Prompts for a string and sets @name to that string.
  #
  # Returns:
  # @name
  #
  # State Changes:
  # @name
  
  def set_name
    puts "Please enter your name: "
    @name = gets.chomp
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

# Class: AI_Player
#
# Models an AI player within the game
#
# Attributes:
# @name           - String: the player's name.
# @possible_name  - Array: lists possible names for the AI Player
# @move           - String: the move the player is using
# @score          - Integer: the number of times the player has won in the current series
# @won            - Boolean: returns true or false if the player has reached the win conditions
#
# Public Methods:
# #increase_score
# #set_name
# #get_move

class AI_Player
  attr_reader :name, :score
  attr_accessor :won, :move
  
  include Shared_Player_Methods
  
  def initialize(rules)
    @name = "AI Player"
    @possible_name = ["Lewis Skolnick", "Milton Waddams", "Claudia Donovan", "Willow Rosenberg"]
    @move = ""
    @score = 0
    @won = false
    @rules = rules
  end
  
  # Public: #set_name
  # Randomly sets @name equal to a value withing @possible_name array.
  #
  # Returns:
  # @name
  #
  # State Changes:
  # @name
  
  def set_name
    @name = @possible_name.sample
  end
  
  # Public: #get_move
  # Randomly sets a move from valid rules provided by the @rules object.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # @move
  
  def get_move
    valid = @rules.provide_moves
    @move = valid.sample
    puts "#{@name} chose #{@move}"
  end
  
end
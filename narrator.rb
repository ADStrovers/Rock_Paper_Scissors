# Class: Narrator
#
# In charge of narrating the game results to last_game.txt
#
# Attributes:
# @players  - Array: holds the player objects from game
# @filename - File: opens the last_game.txt file and sets it to write
#                   after truncating it's length to 0.
#
# Public Methods:
# #scoreboard
# #center
# #two_column_center
# #padding

class Narrator
  
  def initialize(players)
    @players = players
    @filename = File.open("last_game.txt", "w+")
  end
  
  # Public: #scoreboard
  # Outputs the player's scores.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # None
  
  def scoreboard
    padding
    center("Current Scores:")
    two_column_center("#{@players[0].name}: #{@players[0].score}", "#{@players[1].name}: #{@players[1].score}")
    padding
  end
  
  # Public: #center
  # Puts a string centered in a 60 length formatting
  #
  # Parameters:
  # string - String: string to be centered.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # @filename
  
  def center(string)
    @filename.puts string.center(60)
  end
  
  # Public: #center
  # Splits output into two columns and then centers strings within those columns
  #
  # Parameters:
  # string1 - String: string to be centered in left column.
  # string2 - String: string to be centered in right column.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # @filename
  
  def two_column_center(string1, string2)
    @filename.print string1.center(30)
    @filename.puts string2.center(30)
  end
  
  # Public: #padding
  # Outputs 60 ='s for readability sake.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # @filename
  
  def padding
    @filename.puts "=" * 60
  end
  
end
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
  
  def start_rps
    game_type = get_game_type
    player1 = get_player
    player2 = get_player
    factory = PlayerFactory.new
    
    rps_game = Game.new(@rules, player1, player2)
    @winner = rps_game.play_rps
    print_results
  end
  
  private
  
  def get_player
    puts "Enter 1 to add human player. \nEnter 2 to add AI player."
    player_type = gets.chomp
    set_player(player_type)
  end
  
  def set_player(player_type)
    case player_type
    when "1"
      puts "Please enter your name:"
      player = Player.new(gets.chomp)
    when "2"
      puts "Creating AI player.  Please wait."
      player = AI_Player.new(@rules)
      player.set_name
    else
      get_player
    end
    player
  end
      
  
  def get_game_type
    puts "Please select from the following list:\n1. Rock, Paper, Scissors\n2. Rock, Paper, Scissors, Lizard, Spock"
    input = gets.chomp
    set_game_type(input)
  end
  
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
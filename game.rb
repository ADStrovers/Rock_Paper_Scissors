require_relative 'rules'
require_relative 'player'

# require 'pry'

# Class: Game
#
# In charge of running our games.
#
# Attributes:
# @players            - Array: holds player objects
# @victory_condition  - Boolean: Determines if the game has been won
# @winning_player     - String: Holds the name of the last round's winner
# @rules_matrix       - Hash: Contains winning/losing/draw conditions between moves
#
# Public Methods:
# #play_rps

class Game
  
  def initialize(ruleset, player1, player2)
    @validator = ruleset
    @players = [player1, player2]
    @victory_condition = false
  end
  
  # Public: #play_rps
  # Starts and then plays the game with the provided players.
  #
  # Parameters:
  # None currently
  #
  # Returns:
  # @winning_player: Whoever was victorious.
  #
  # State Changes:
  # Not responsible for state changes.
  
  def play_rps
    wins_needed
    until wins_needed_met?
      get_rps_moves
      result(@players[0], @players[1])
    end
  end
  
  # private
  
  # Private: #wins_needed
  # Defines the wins needed based on user input.
  #
  # Parameters:
  # None
  #
  # Returns:
  # @victory_condition
  #
  # State Changes:
  # Sets @victory_condition
  
  def wins_needed
    x = 0
    until x != 0
      print "How many rounds need to be won to win the game? "
      x = gets.chomp.to_i
      if x == 0
        "I'm sorry that is not a valid number. Please try again."
      end
    end
    @victory_condition = x
  end
  
  # Private: #get_rps_moves
  # Takes input from player on desired move and checks to see if it is valid.
  #
  # Parameters:
  # None
  #
  # Returns:
  # @player
  #
  # State Changes:
  # Changes the state of move for people player within @players.
  
  def get_rps_moves
    @players.each do |player|
      until @validator.validate_move(player.move)
        player.get_move
      end
    end
  end
  
  # Private: #result
  # Takes input from player on desired move and checks to see if it is valid.
  #
  # Parameters:
  # None
  #
  # Returns:
  # @player
  #
  # State Changes:
  # Changes the state of move for people player within @players.
  
  def result(player1, player2)
    compare = @validator.compare_results(player1.move, player2.move)
    case compare
    when "Win"
      player1.increase_score
      puts "Congrats #{player1.name}!  You won this round."
    when "Lose"
      player2.increase_score
      puts "Congrats #{player2.name}!  You won this round."
    else
      puts "This round was a tie."
    end
    player1.move = player2.move = ""
  end
  
  def wins_needed_met?
    done = false
    @players.each do |player|
      if player.score == @victory_condition
        done = true
      end
    end
    done
  end
  
end
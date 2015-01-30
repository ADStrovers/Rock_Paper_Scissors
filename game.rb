require_relative 'driver'
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
  
  def initialize(player1, player2)
    @players = [player1, player2]
    @victory_condition = false
    @winning_player = ""
    @rules_matrix = {"Rock"     => {"Rock" => "Draw", "Paper" => "Lose", "Scissors" => "Win"},
                     "Paper"    => {"Rock" => "Win", "Paper" => "Draw", "Scissors" => "Lose"},
                     "Scissors" => {"Rock" => "Win", "Paper" => "Draw", "Scissors" => "Lose"}}
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
      compare_results(@players[0], @players[1])
      print_result
    end
    @winning_player
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
      until @rules_matrix.has_key?(player.move)
        print "#{player.name}, please give me your move: "
        player.move = gets.chomp.capitalize
      end
    end
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
  
  def compare_results(player1, player2)
    result = @rules_matrix[player1.move][player2.move]
    case result
    when "Win"
      @winning_player = player1.name
      player1.increase_score
    when "Lose"
      @winning_player = player2.name
      player2.increase_score
    end
    player1.move = player2.move = ""
  end
  
  def print_result
    if @winning_player == ""
      puts "This round was a tie."
    else
      puts "Congrats #{@winning_player}!  You won this round."
    end
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

# binding.pry
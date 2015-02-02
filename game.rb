require_relative 'rules'
require_relative 'player'
require_relative 'narrator'

# require 'pry'

# Class: Game
#
# In charge of running our games.
#
# Attributes:
# @validator          - Object: Takes in the Rules objects that we pass to it
# @players            - Array: holds player objects
# @victory_condition  - Boolean: Determines if the game has been won
# @printer            - Narrator: Handles game result output to text file
# @winner             - String: Name of the winning object
#
# Public Methods:
# #play

class Game
  
  def initialize(ruleset, *players)
    @validator = ruleset
    @players = players
    @victory_condition = 0
    @printer = Narrator.new(@players)
  end
  
  # Private: #play
  # Starts the game.
  #
  # Parameters:
  # None
  #
  # Returns:
  # nil
  #
  # State Changes:
  # None
  
  def play
    wins_needed
    puts "Valid moves are: #{@validator.provide_moves.join(", ")}"
    until wins_needed_met?
      @printer.scoreboard
      get_moves
      y = compare(@players[0], @players[1])
    end
    print_final_winner
  end
  
  private
  
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
  # @victory_condition
  
  def wins_needed
    until @victory_condition > 0
      print "How many rounds need to be won to win the game? "
      @victory_condition = gets.chomp.to_i
      if @victory_condition <= 0
        "I'm sorry that is not a valid number. Please try again."
      end
    end
    @victory_condition
  end
  
  # Private: #get_moves
  # Loops until player.get_move passes a validation against the rules.
  # Prints move chosen.
  #
  # Parameters:
  # None
  #
  # Returns:
  # @players array
  #
  # State Changes:
  # None
  
  def get_moves
    @players.each do |player|
      until @validator.validate_move(player.move)
        player.get_move
      end
      @printer.center("#{player.name} chose #{player.move}")
    end
  end
  
  # Private: #compare
  # Passes moves to the ruleset for comparison and then wipes the moves and calls result.
  #
  # Parameters:
  # player1   - Player: first player object
  # player2   - Player: first player object
  #
  # Returns:
  # nil
  #
  # State Changes:
  # None
  
  def compare(player1, player2)
    winner, moves = @validator.compare_results(player1.move, player2.move)
    player1.move = player2.move = ""  # Does this break LoD?  I assume it does..
    @printer.center(moves)
    result(winner)
  end
  
  # Private: #result
  # Takes input from player on desired move and checks to see if it is valid.
  #
  # Parameters:
  # int   - Integer: Position within @players that the winning object resides.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # None
  
  def result(int)
    case int
    when 0
      @players[int].increase_score
      @printer.center("Congrats #{@players[0].name}!  You won this round.")
    when 1
      @players[int].increase_score
      @printer.center("Congrats #{@players[1].name}!  You won this round.")
    else
      @printer.center "This round was a tie."
    end
    if int
      @players[int].name
    end
  end

  # Private: #wins_needed_met
  # Checks each player's .score to see if it matches the @victory_condition.
  #
  # Parameters:
  # None
  #
  # Returns:
  # Boolean: done
  #
  # State Changes:
  # @winner
  
  def wins_needed_met?
    done = false
    @players.each do |player|
      if player.score == @victory_condition
        done = player.won = true
        @winner = player.name
      end
    end
    done
  end
  
  # Private: #print_final_results
  # Responsible for passing @winner to printer.
  #
  # Parameters:
  # None
  #
  # Returns:
  # nil
  #
  # State Changes:
  # None
  
  def print_final_winner
    @printer.padding
    @printer.center("Congrats #{@winner}!  You won the game!")
  end
  
end
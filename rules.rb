module Shared_Rules_Methods
  
  # Public: #provide_moves
  # Prints out the valid moves based on the current rule set.
  #
  # Parameters:
  # None
  #
  # Returns:
  # Nil
  #
  # State Changes:
  # None
  
  def provide_moves(args = 0)
    valid_moves = @rules_matrix.keys
    valid_moves
  end
  
  # Public: #validate_move
  # Checks to see if passed in argument is found within the rules_matrix as a valid move.
  #
  # Parameters:
  # move  - String: Move to be compared to the matrix
  #
  # Returns:
  # True/False - Boolean
  #
  # State Changes:
  # None

  def validate_move(move)
    @rules_matrix.has_key?(move)
  end
  
  # Public: #compare_results
  # Accesses the @rules_matrix to give the winners position
  #
  # Parameters:
  # move1   - String: Player 1's move
  # move2   - String: Player 2's move
  #
  # Returns:
  # nil, 0, or 1.
  #
  # State Changes:
  # None
  
  def compare_results(move1, move2)
    return @rules_matrix[move1][move2][0], @rules_matrix[move1][move2][1]
  end
  
end

class RPSRules
  
  include Shared_Rules_Methods
  
  # Private (Automagical): #initialize
  # Initializes a hash within a hash that says who wins within the context for rock paper scissors.
  #   To use, see compare_results that accesses the hash position and spits out the array position
  #   of the winner assuming the array is: [player1, player2]
  #
  # State Changes:
  # @rules_matrix
  
  def initialize
    @win_strings = ["Rock Crushes Scissors", "Paper Covers Rock", "Scissors Cut Paper"]
    @rules_matrix = {"Rock"     => {"Rock" => [nil], "Paper" => [1, @win_strings[1]], "Scissors" => [0, @win_strings[0]]},
                     "Paper"    => {"Rock" => [0, @win_strings[1]], "Paper" => [nil], "Scissors" => [1, @win_strings[2]]},
                     "Scissors" => {"Rock" => [1, @win_strings[0]], "Paper" => [0, @win_strings[2]], "Scissors" => [nil]}}
  end

end

class RPSLSRules
  
  include Shared_Rules_Methods
  
  # Private (Automagical): #initialize
  # Initializes a hash within a hash that says who wins within the context for rock paper scissors.
  #   To use, see compare_results that accesses the hash position and spits out the array position
  #   of the winner assuming the array is: [player1, player2]
  #
  # State Changes:
  # @rules_matrix
  
  def initialize
    @win_strings = ["Rock Crushes Scissors", "Paper Covers Rock", "Scissors Cut Paper", 
                    "Rock Crushes Lizard", "Spock Vaporizes Rock", "Lizard Poisons Spock", 
                    "Spock Smashes Scissors", "Scissors Decapitates Lizard", 
                    "Lizard Eats Paper", "Paper Disproves Spock"]
    @rules_matrix = {"Rock"     => {"Rock" => [nil], "Paper" => [1, @win_strings[1]], "Scissors" => [0, @win_strings[0]], 
                                    "Lizard" => [0, @win_strings[3]], "Spock" => [1, @win_strings[4]]},
                     "Paper"    => {"Rock" => [0, @win_strings[1]], "Paper" => [nil], "Scissors" => [1, @win_strings[2]], 
                                    "Lizard" => [1, @win_strings[8]], "Spock" => [0, @win_strings[9]]},
                     "Scissors" => {"Rock" => [1, @win_strings[0]], "Paper" => [0, @win_strings[2]], "Scissors" => [nil], 
                                    "Lizard" => [0, @win_strings[7]], "Spock" => [1, @win_strings[6]]},
                     "Lizard"   => {"Rock" => [1, @win_strings[3]], "Paper" => [0, @win_strings[8]], "Scissors" => [1, @win_strings[7]], 
                                    "Lizard" => [nil], "Spock" => [0, @win_strings[5]]},
                     "Spock"    => {"Rock" => [0, @win_strings[4]], "Paper" => [1, @win_strings[9]], "Scissors" => [0, @win_strings[6]], 
                                    "Lizard" => [1, @win_strings[5]], "Spock" => [nil]}}
  end
  
end
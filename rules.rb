class RPSRules
  
  # Private (Automagical): #initialize
  # Initializes a hash within a hash that says who wins within the context for rock paper scissors.
  #   To use, see compare_results that accesses the hash position and spits out the array position
  #   of the winner assuming the array is: [player1, player2]
  #
  # State Changes:
  # @rules_matrix
  
  def initialize
    @rules_matrix = {"Rock"     => {"Rock" => nil, "Paper" => 1, "Scissors" => 0},
                     "Paper"    => {"Rock" => 0, "Paper" => nil, "Scissors" => 1},
                     "Scissors" => {"Rock" => 1, "Paper" => 0, "Scissors" => nil}}
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
    @rules_matrix[move1][move2]
  end
  
end
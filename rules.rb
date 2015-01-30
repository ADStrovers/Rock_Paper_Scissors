class RPSRules
  
  def initialize
    @rules_matrix = {"Rock"     => {"Rock" => 0, "Paper" => 2, "Scissors" => 1},
                     "Paper"    => {"Rock" => 1, "Paper" => 0, "Scissors" => 2},
                     "Scissors" => {"Rock" => 2, "Paper" => 1, "Scissors" => 0}}
  end

  def validate_move(move)
    @rules_matrix.has_key?(move)
  end
  
  def compare_results(move1, move2)
    @rules_matrix[move1][move2]
  end
  
end
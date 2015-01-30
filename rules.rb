class RPSRules
  
  def initialize
    @rules_matrix = {"Rock"     => {"Rock" => "Draw", "Paper" => "Lose", "Scissors" => "Win"},
                     "Paper"    => {"Rock" => "Win", "Paper" => "Draw", "Scissors" => "Lose"},
                     "Scissors" => {"Rock" => "Win", "Paper" => "Draw", "Scissors" => "Lose"}}
  end

  def validate_move(move)
    @rules_matrix.has_key?(move)
  end
  
  def compare_results(move1, move2)
    @rules_matrix[move1][move2]
  end
  
end
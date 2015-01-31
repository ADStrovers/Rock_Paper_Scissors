class AI_Player
  attr_reader :name, :score
  attr_accessor :won, :move
  
  def initialize
    @name = "AI Player"
    @move = ""
    @score = 0
    @won = false
  end
  
  def increase_score(inc = 1)
    @score += inc.to_i
  end
  
  def get_move
    
  end
  
end
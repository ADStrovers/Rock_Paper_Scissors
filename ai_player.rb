class AI_Player
  attr_reader :name, :score
  attr_accessor :won, :move
  
  def initialize(rules)
    @name = "AI Player"
    @move = ""
    @score = 0
    @won = false
    @rules = rules
  end
  
  def set_name
    name = rand(3)
    case name
    when 0
      @name = "Lewis Skolnick"
    when 1
      @name = "Milton Waddams"
    when 2
      @name = "Claudia Donovan"
    when 3
      @name = "Willow Rosenberg"
    end
  end
  
  def increase_score(inc = 1)
    @score += inc.to_i
  end
  
  def get_move
    valid = @rules.provide_moves
    @move = valid.sample
  end
  
end
class Game
  @players = []
  @valid_moves = ["Rock", "Paper", "Scissors"]
  @rules_matrix = {"Rock" => {"Rock" => "Draw", "Paper" => "Lose", "Scissors" => "Win"},
                   "Paper" => {"Rock" => "Win", "Paper" => "Draw", "Scissors" => "Lose"},
                   "Scissors" => {"Rock" => "Win", "Paper" => "Draw", "Scissors" => "Lose"}}
    
  def initialize(*players)
    @players = players.each
    @victory_condition = nil
    @winning_player = ""
  end
  
  def play_rps
    wins_needed
    until wins_needed_met?
      get_rps_moves
      compare_results(@players[0], @players[1])
      print_result
    end
  end
  
  def wins_needed
    x = 0
    until x != 0
      print "How many rounds need to be won to win the game? "
      x = gets.chomp.to_i
      if x == 0
        "I'm sorry that is not a valid number. Please try again."
      end
      puts x
    end
    @victory_condition = x
  end
  
  def get_rps_moves
    @players.each do |player|
      until @rules_matrix.has_key?(player.move)
        print "#{player.name}, please give me your move: "
        player.move = gets.chomp.capitalize
      end
    end
  end
  
  def compare_results(player1, player2)
    result = @rules_matrix[player1.move][player2.move]
    case result
    when "Win"
      @winning_player = player1.name
      player1.score += 1
    when "Lose"
      @winning_player = player2.name
      player2.score += 1
    end
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
      if player.score == wins_needed
        done = true
      end
    end
    done
  end
  
end
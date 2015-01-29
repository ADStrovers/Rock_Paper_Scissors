# Player classes + overall driver method. Driver method should create players, tell the players to prompt for moves, and determine the winner. Players should keep track of their names and moves, and should still only accept valid moves. From the user’s perspective, the game should appear to work exactly the same.

require 'pry'

def start_rps(name1 = "Player 1", name2 = "Player 2")
  valid_moves = {"Rock" => 1, "Paper" => 3, "Scissors" => 7}
  player1 = Player.new(name1)
  player2 = Player.new(name2)
  while valid_moves.include?(player1.move) == false
    print "Player 1, please give me a valid move: "
    player1.move = gets.chomp.capitalize
  end
  while valid_moves.include?(player2.move) == false
    print "Player 2, please give me a valid move: "
    player2.move = gets.chomp.capitalize
  end
  result = valid_moves[player1.move] + valid_moves[player2.move]
  case result
  when 2, 6, 14
    puts "Round ended in a tie."
  when 4
    if player1.move == "Rock"
      puts "Congratulations Player 1! You win!"
    else
      puts "Congratulations Player 2! You win!"
    end
  when 10
    if player1.move == "Scissors"
      puts "Congratulations Player 1! You win!"
    else
      puts "Congratulations Player 2! You win!"
    end
  when 8
    if player1.move == "Paper"
      puts "Congratulations Player 1! You win!"
    else
      puts "Congratulations Player 2! You win!"
    end
  end
end


class Player
  attr_reader :name
  attr_accessor :move
  
  def initialize(name)
    @name = name
    @move = ""
  end
end

binding.pry
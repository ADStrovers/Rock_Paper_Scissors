# Go back and provide method documentation for all of your classes and custom-written methods. If you wrote the class (or method), you gotta document it.

require 'pry'
require_relative 'player.rb'

# Public: #start_rps
# Starts and then plays the game with the provided players.
#
# Parameters:
# wins_needed - Wins needed to conclude a series of rounds.  Default is 1.
# name1       - Name of the first player to be created
# name2     - Name of the second player to be created
#
# Returns:
# A hash of valid moves
#
# State Changes:
# None.  All changes are local and will be obliterated upon conclusion of the method.

def start_rps(wins_needed = 1, name1 = "Player 1", name2 = "Player 2")
  valid_moves = {"Rock" => 1, "Paper" => 3, "Scissors" => 7}
  player1 = Player.new(name1)
  player2 = Player.new(name2)
  while player1.score < wins_needed && player2.score < wins_needed
    until valid_moves.include?(player1.move) && valid_moves.include?(player2.move)
      while valid_moves.include?(player1.move) == false
        print "#{player1.name}, please give me a valid move: "
        player1.move = gets.chomp.capitalize.strip
      end
      while valid_moves.include?(player2.move) == false
        print "#{player2.name}, please give me a valid move: "
        player2.move = gets.chomp.capitalize.strip
      end
    end
    result = valid_moves[player1.move] + valid_moves[player2.move]
    case result
    when 2, 6, 14
      puts "Round ended in a tie."
    when 4
      if player1.move == "Rock"
        puts "Congratulations #{player1.name}! You win this round!"
        player1.score += 1
      else
        puts "Congratulations #{player2.name}! You win this round!"
        player2.score += 1
      end
    when 10
      if player1.move == "Scissors"
        puts "Congratulations #{player1.name}! You win this round!"
        player1.score += 1
      else
        puts "Congratulations #{player2.name}! You win this round!"
        player2.score += 1
      end
    when 8
      if player1.move == "Paper"
        puts "Congratulations #{player1.name}! You win this round!"
        player1.score += 1
      else
        puts "Congratulations #{player2.name}! You win this round!"
        player2.score += 1
      end
    end
    puts "Player 1 Wins: #{player1.score}, Player 2 Wins: #{player2.score}.  Wins Needed: #{wins_needed}"
    player1.move = ""
    player2.move = ""
  end
  print "Congratulations "
  if player1.score == wins_needed
    print player1.name
  else
    print player2.name
  end
  print ".  You win!"
  
  valid_moves
end

binding.pry
# Basic rock-paper-scissors game (no custom objects). Output should be sensibly formatted. Should only accept valid moves. Players only need to play a single round.

valid_throws = {"Rock" => 1, "Paper" => 3, "Scissors" => 7}
p1_throw = ""
p2_throw = ""
while valid_throws.include?(p1_throw) == false
  print "Player 1, please give me a valid throw: "
  p1_throw = gets.chomp.capitalize
end
while valid_throws.include?(p2_throw) == false
  print "Player 2, please give me a valid throw: "
  p2_throw = gets.chomp.capitalize
end
result = valid_throws[p1_throw] + valid_throws[p2_throw]
case result
when 2, 6, 14
  puts "Round ended in a tie."
when 4
  if p1_throw == "Rock"
    puts "Congratulations Player 1! You win!"
  else
    puts "Congratulations Player 2! You win!"
  end
when 10
  if p1_throw == "Scissors"
    puts "Congratulations Player 1! You win!"
  else
    puts "Congratulations Player 2! You win!"
  end
when 8
  if p1_throw == "Paper"
    puts "Congratulations Player 1! You win!"
  else
    puts "Congratulations Player 2! You win!"
  end
end
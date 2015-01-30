require 'pry'
require_relative 'player.rb'
require_relative 'game.rb'

class Driver
  def initialize
  end
  
  def play_rps(name1, name2)
    player1 = Player.new(name1)
    player2 = Player.new(name2)
    rps_game = Game.new(player1, player2)
    @winner = rps_game.play_rps
    print_results
  end
  
  private
  
  def print_results
    puts "Congrats #{@winner}!  You won the game!"
  end
end

binding.pry
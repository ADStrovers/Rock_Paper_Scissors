class Narrator
  
  def initialize(players)
    @players = players
    @filename = File.open("last_game.txt", "w+")
  end
  
  def scoreboard
    padding
    center("Current Scores:")
    two_column_center("#{@players[0].name}: #{@players[0].score}", "#{@players[1].name}: #{@players[1].score}")
    padding
  end
  
  def center(string)
    @filename.puts string.center(60)
  end
  
  def two_column_center(string1, string2)
    @filename.print string1.center(30)
    @filename.puts string2.center(30)
  end
  
  def padding
    @filename.puts "=" * 60
  end
  
end
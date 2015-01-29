require 'minitest/autorun'
require_relative 'rock-paper-scissor'

class PlayerTest < Minitest::Test
  
  def test_player_should_return_a_name
    pl = Player.new("Andrew")
    assert_equal "Andrew", pl.name
  end
  
  def test_player_should_set_move
    pl = Player.new("Andrew")
    pl.move = "Rock"
    assert_equal "Rock", pl.move
  end
  
end
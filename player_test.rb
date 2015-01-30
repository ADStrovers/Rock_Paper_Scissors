require 'minitest/autorun'
require_relative 'player'

class PlayerTest < Minitest::Test
  
  def test_player_should_return_a_name
    pl = Player.new("Andrew")
    assert_equal "Andrew", pl.name
  end
  
  def test_how_player_name_handles_non_strings
    pl = Player.new(1)
    assert_equal 1, pl.name
  end
  
  def test_player_should_set_move
    pl = Player.new("Andrew")
    pl.move = "Rock"
    assert_equal "Rock", pl.move
  end
  
  def test_player_score_increments_by_one_without_params
    pl = Player.new("Andrew")
    pl.increase_score
    assert_equal 1, pl.score
  end
  
end
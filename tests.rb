require 'minitest/autorun'
require_relative 'player'
require_relative 'rules'
require_relative 'narrator'
require_relative 'player_factory'

class RulesTest < Minitest::Test
  
  def test_provide_moves_should_return_an_array
    rs = RPSRules.new
    test = rs.provide_moves
    assert_instance_of Array, test
  end
  
  def test_validate_move_should_give_false_for_none_valid_moves
    rs = RPSRules.new
    test = rs.validate_move("Moo")
    assert_equal false, test
  end
  
  def test_compare_results_should_give_nil_back_on_ties
    rs = RPSRules.new
    test, string = rs.compare_results("Rock", "Rock")
    assert_equal nil, test
  end
  
end

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
  
  def test_edge_cases_for_increase_score_method
    pl = Player.new("Erin")
    pl.increase_score "Zoom"
    assert_equal 0, pl.score
  end
  
end

class PlayerFactoryTest < Minitest::Test

  def test_ai_player_check_should_return_boolean
    pf = PlayerFactory.new "Andrew"
    test = pf.ai_player_check
    refute test
  end
  
end

class NarratorTest < Minitest::Test
  
end
require 'minitest/autorun'
require_relative '../rules'

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
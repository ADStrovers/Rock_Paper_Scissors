require 'minitest/autorun'
require_relative '../rules'

class RulesTest < Minitest::Test
  
  def test_provide_moves_should_not_return_a_value
    rs = RPSRules.new
    test = rs.provide_moves
    assert_equal nil, test
  end
  
  def test_validate_move_should_give_false_for_none_valid_moves
    rs = RPSRules.new
    test = rs.validate_move("Moo")
    assert_equal false, test
  end
  
  def test_compare_results_should_give_nil_back_on_bad_keys
    rs = RPSRules.new
    test = rs.compare_results("Rock", "Cow")
    assert_equal nil, test
  end
  
end
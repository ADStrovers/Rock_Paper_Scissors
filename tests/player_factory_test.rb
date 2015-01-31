require 'minitest/autorun'
require_relative '../player_factory'

class PlayerFactoryTest < Minitest::Test

  def test_ai_player_check_should_return_boolean
    pf = PlayerFactory.new "Andrew"
    test = pf.ai_player_check
    refute test
  end
  
end
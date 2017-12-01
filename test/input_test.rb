require "minitest/autorun"
require "minitest/pride"
require "./lib/input"

class InputTest < Minitest::Test

  def test_it_exists
    input = Input.new

    assert_instance_of Input, input
  end

  def test_it_gets_input
    input = Input.new

    input = input.user_input

    assert_equal "rgby", input
  end

  def test_it_downcases_input
    input = Input.new

    input = input.user_input

    assert_equal "rgby", input
  end
end

require "minitest/autorun"
require "minitest/pride"
require "./lib/check"
require "pry"

class CheckTest < Minitest::Test

  def test_it_exists
    check = Check.new

    assert_instance_of Check, check
  end

  def test_it_finds_correct_colors
    check = Check.new

    correct_colors = check.find_colors(["r", "b", "b", "y"], "rgby")

    assert_equal 3, correct_colors
  end

  def test_it_finds_correct_colors_again
    check = Check.new

    correct_colors = check.find_colors(["r", "g", "b", "y"], "rrry")

    assert_equal 2, correct_colors
  end

  def test_correct_colors_again_because_i_dont_trust_it
    check = Check.new

    correct_colors = check.find_colors(["g", "y", "r", "r"], "rrrb")

    assert_equal 1, correct_colors
  end

  def test_it_to_see_if_it_finds_correct_position
    check = Check.new

    correct_position = check.find_position(["r", "r", "b", "b"], "rbrb")

    assert_equal 2, correct_position
  end

  def test_it_to_see_if_it_finds_the_correct_position_again
    check = Check.new

    elements = ["r", "g", "b", "y"]
    input = "ybgr"
    correct_position = check.find_position(elements)

    assert_equal 0, correct_position
  end

  def test_correct_position_because_i_dont_trust_it
    check = Check.new

    elements = ["b", "g", "y", "r"]
    input = "bgyr"
    correct_position = check.find_position(elements, input)

    assert_equal 4, correct_position
  end
end

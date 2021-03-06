require "minitest/autorun"
require "minitest/pride"
require "./lib/check"
require "pry"

class CheckTest < Minitest::Test

  def test_it_exists
    check = Check.new

    assert_instance_of Check, check
  end

  def test_correct_colors_for_three
    check = Check.new

    elements = ["r", "b", "b", "y"]
    input = "rgby"
    correct_colors = check.find_colors(elements, input)

    assert_equal 3, correct_colors
  end

  def test_correct_colors_for_zero
    check = Check.new

    elements = ["r", "r", "r", "r"]
    input = "gbyg"
    correct_colors = check.find_colors(elements, input)

    assert_equal 0, correct_colors
  end

  def test_correct_colors_for_two
    check = Check.new

    elements = ["r", "g", "b", "y"]
    input = "rrry"
    correct_colors = check.find_colors(elements, input)

    assert_equal 2, correct_colors
  end

  def test_correct_colors_for_one
    check = Check.new

    elements = ["g", "y", "r", "r"]
    input = "rrrb"
    correct_colors = check.find_colors(elements, input)

    assert_equal 1, correct_colors
  end

  def test_correct_colors_for_four
    check = Check.new

    elements = ["r", "b", "g", "y"]
    input = "ygbr"
    correct_colors = check.find_colors(elements, input)

    assert_equal 4, correct_colors
  end

  def test_correct_position_for_two
    check = Check.new

    elements = ["r", "r", "b", "b"]
    input = "rbrb"
    correct_position = check.find_position(elements, input)

    assert_equal 2, correct_position
  end

  def test_correct_position_for_zero
    check = Check.new

    elements = ["r", "g", "b", "y"]
    input = "ybgr"
    correct_position = check.find_position(elements, input)

    assert_equal 0, correct_position
  end

  def test_correct_position_for_four
    check = Check.new

    elements = ["b", "g", "y", "r"]
    input = "bgyr"
    correct_position = check.find_position(elements, input)

    assert_equal 4, correct_position
  end

  def test_correct_position_for_one
    check = Check.new

    elements = ["b", "g", "y", "r"]
    input = "gbrr"
    correct_position = check.find_position(elements, input)

    assert_equal 1, correct_position
  end

  def test_correct_position_for_three
    check = Check.new

    elements = ["b", "g", "y", "r"]
    input = "bgyg"
    correct_position = check.find_position(elements, input)

    assert_equal 3, correct_position
  end
end

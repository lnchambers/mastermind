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

    correct_position = check.find_position(["r", "g", "b", "y"], "ybgr")

    assert_equal 0, correct_position
  end

  def test_correct_position_because_i_dont_trust_it
    check = Check.new

    correct_position = check.find_position(["b", "g", "y", "r"], "bgyr")

    assert_equal 4, correct_positio
  end

  def test_correct_guess_ends_loop
    check = Check.new

    correct_guess = check.correct(["b", "g", "r", "y"], "bgry")

    assert_equal nil, correct_guess
  end
end

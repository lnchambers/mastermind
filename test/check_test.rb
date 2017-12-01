require "minitest/autorun"
require "minitest/pride"
require "./lib/check"
require "pry"

class CheckTest < Minitest::Test

  def test_it_exists
    check = Check.new("","")

    assert_instance_of Check, check
  end

  def test_it_finds_correct_colors
    check = Check.new("rbby", "rgby")

    correct_colors = check.find_colors("rbby", "rgby")

    assert_equal 3, correct_colors
  end

  def test_it_finds_correct_colors_again
    check = Check.new("rgby", "rrry")

    correct_colors = check.find_colors("rgby", "rrry")

    assert_equal 2, correct_colors
  end

  def test_correct_colors_again_because_i_dont_trust_it
    check = Check.new("gyrr", "rrrb")

    correct_colors = check.find_colors("gyrr", "rrrb")

    assert_equal 1, correct_colors
  end

  def test_it_to_see_if_it_finds_correct_position
    check = Check.new("rrbb", "rbrb")

    correct_position = check.find_position("rrbb", "rbrb")

    assert_equal 2, correct_position
  end

  def test_it_to_see_if_it_finds_the_correct_position_again
    check = Check.new("rgby", "ybgr")

    correct_position = check.find_position("rgby", "ybgr")

    assert_equal 0, correct_position
  end

  def test_correct_position_because_i_dont_trust_it
    check = Check.new("bgyr", "bgyr")

    correct_position = check.find_position("bgyr", "bgyr")

    assert_equal 4, correct_position
  end

  def test_correct_guess_ends_loop
    check = Check.new("bgry", "bgry")

    correct_guess = check.correct("bgry", "bgry")

    assert_equal nil, correct_guess
  end
end

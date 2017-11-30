require "minitest/autorun"
require "minitest/pride"
require "./lib/check"

class CheckTest < Minitest::Test

  def test_it_exists
    check = Check.new

    assert_instance_of Check, check
  end

  def test_it_finds_correct_colors
    check = Check.new

    correct_colors = check.find_colors("rbby", "rgby")

    assert_equal 3, correct_colors
  end

  def test_it_finds_correct_colors_again
    check = Check.new

    correct_colors = check.find_colors("rgby", "rrry")

    assert_equal 2, correct_colors
  end

  def test_it_again_because_i_dont_trust_it
    check = Check.new

    correct_colors = check.find_colors("rrrb", "gyrr")

    assert_equal 2, correct_colors
  end
end

require "minitest/autorun"
require "minitest/pride"
require "./lib/check"

class CheckTest < Minitest::Test

  def test_it_exists
    check = Check.new

    assert_instance_of Check, check
  end

  # def test_it_accepts_correct_input
  #   check = Check.new
  #
  #   elements = input
end

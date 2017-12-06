require "minitest/autorun"
require "minitest/pride"
# require "minitest/emoji"
require "./lib/generate"
require "pry"

class GenerateTest < Minitest::Test

  def test_it_exists
    generate = Generate.new

    assert_instance_of Generate, generate
  end

  def test_easy_generates_the_right_number_of_elements
    generate = Generate.new

    easy = generate.easy

    assert_equal 4, easy.length
  end

  def test_medium_generates_the_right_number_of_elements
    generate = Generate.new

    medium = generate.medium

    assert_equal 6, medium.length
  end

  def test_hard_generates_the_right_number_of_elements
    generate = Generate.new

    hard = generate.hard

    assert_equal 8, hard.length
  end
end

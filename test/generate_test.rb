require "minitest/autorun"
require "minitest/pride"
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
end 

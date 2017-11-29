require "minitest/autorun"
require "minitest/pride"
require "./lib/generate"

class GenerateTest < Minitest::Test
  def test_it_exists
    generate = Generate.new

    assert_instance_of Generate, generate
  end
end

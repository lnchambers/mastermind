require "minitest/autorun"
require "minitest/pride"
require "./lib/sequence"

class SequenceTest < Minitest::Test

  def test_it_exists
    sequence = Sequence.new

    assert_instance_of Sequence, sequence
  end
end

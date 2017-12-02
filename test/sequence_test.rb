require "minitest/autorun"
require "minitest/pride"
require "./lib/sequence"

class SequenceTest

  def test_it_exists
    sequence = Sequence.new

    assert_instance_of Sequence, sequence
  end

  def test_it_for_element_creation
    sequence = Sequence.new

    assert_equal 4, @elements.length
  end

end

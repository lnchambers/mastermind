require "pry"

class Check

  attr_reader :correct_colors
              :correct_position

  def initialize
    @elements
    @input
    @correct_colors = 0
    @correct_position = 0
  end

  def correct (elements, input)
    if
      elements = input.chars
    elsif
      find_position
      find_colors
    end
  end

  def find_position (elements, input)
    @correct_position = input.chars.zip(elements)
    @correct_position.count {|x, y| x == y }
  end

  def find_colors (elements, input)
    elements.uniq.count do |element|
      @correct_colors += 1 if input.include? (element)
      input.delete(element) if input.include? (element)
    end
  end
end

require "pry"

class Check

  attr_reader :correct_colors
              :correct_position

  def initialize (elements, input)
    @elements = elements
    @input = input
    @correct_colors = 0
    @correct_position = 0
  end

  def correct (elements, input)
    if
      elements = input
    elsif
      find_position
      find_colors
    end
  end

  def find_position (elements, input)
    @correct_position += 1 if elements[0] == input[0]
    @correct_position += 1 if elements[1] == input[1]
    @correct_position += 1 if elements[2] == input[2]
    @correct_position += 1 if elements[3] == input[3]
    @correct_position
  end

  def find_colors (elements, input)
    elements.chars.uniq.count do |element|
      @correct_colors += 1 if input.include? (element)
      input.delete(element) if input.include? (element)
    end
  end
end

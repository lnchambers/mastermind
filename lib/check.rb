require "pry"

class Check

  attr_reader :correct_colors
              :correct_position

  def initialize
    @correct_colors = 0
    @correct_position = 0
  end

  def find_position(elements, input)
    @correct_position = input.chars.zip(elements)
    @correct_position.count {|input, element| input == element }
  end

  def find_colors(elements, input)
    elements.uniq.count do |element|
      @correct_colors += 1 if input.include? (element)
      input.delete(element) if input.include? (element)
    end
  end
end

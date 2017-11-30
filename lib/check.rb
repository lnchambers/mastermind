require "pry"

class Check

  def initialize
    generate = Generate.new
    @elements = generate.easy
    @input
    @correct_colors = 0
  end

  def correct (@elements, input)
    if
      elements = input
    else
      find_position
      find_colors
    end
  end


  def find_position

  end

  def find_colors (elements, input)
    elements.chars.uniq.count do |element|
      @correct_colors += 1 if input.include? (element)
      input.delete(element)
    end
  end
end

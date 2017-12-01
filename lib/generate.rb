require "pry"

class Generate

  attr_reader :elements

  def initialize
    @colors_easy = ["r", "b", "g", "y"]
    @element = []
  end

  def easy
    4.times do
      @elements = @element << @colors_easy.sample
    end
    @elements
  end
end

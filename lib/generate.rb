require "pry"

class Generate

  attr_reader :elements

  def initialize
    @colors_easy = ["r", "b", "g", "y"]
    @elements = []
  end

  def easy
    4.times do
      @elements << @colors_easy.sample
    end
    @elements
  end
end

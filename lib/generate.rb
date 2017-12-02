require "pry"

class Generate

  attr_reader :element

  def initialize
    @colors_easy = ["r", "b", "g", "y"]
    @element = []
  end

  def easy
    4.times do
      @element << @colors_easy.sample
    end
    @element
  end
end 

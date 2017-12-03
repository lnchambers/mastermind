require "pry"

class Generate

  attr_reader :element

  def initialize
    @colors_easy = ["r", "b", "g", "y"]
    @colors_medium = ["r", "b", "g", "y", "p"]
    @colors_hard = ["r", "b", "g", "y", "p", "o"]
    @element = []
  end

  def easy
    4.times do
      @element << @colors_easy.sample
    end
    @element
  end

  def medium
    6.times do
      @element << @colors_medium.sample
    end
    @element
  end

  def hard
    8.times do
      @element << @colors_hard.sample
    end
    @element
  end
end

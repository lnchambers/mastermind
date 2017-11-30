require "pry"

class Generate

  attr_reader :elements

  def initialize
    @colors_easy = ["r", "b", "g", "y"]
    @colors_medium = ["r", "b", "g", "y", "p"]
    @colors_hard = ["r", "b", "g", "y", "p", "o"]
    @elements = []
  end

  def easy
    4.times do
      @elements << @colors_easy.sample
    end
    @elements
  end

  def medium
    6.times do
      @elements << @colors_medium.sample
    end
    @elements
  end

  def hard
    8.times do
      @elements << @colors_hard.sample
    end
    @elements
  end



end

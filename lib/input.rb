class Input

  attr_reader :input

  def initiliaze
    @input
  end

  def user_input
    @input = gets.chomp.downcase
  end
end

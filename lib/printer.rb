require "pry"

class Printer

  def initialize(input, correct_colors, correct_position, elements, time_spent)
    @input = input
    @correct_colors = correct_colors
    @correct_position = correct_position
    @elements = elements
    @time_spent = time_spent
  end

  def begin
    puts "Welcome to MASTERMIND!"
    puts ">" & sleep(0.5) * 3
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    puts ">"
  end

  def sequence
    puts "I have generated a sequence of four colors composed of :"
    sleep(0.5)
    puts "(R)ed"
    sleep(0.5)
    puts "(B)lue"
    sleep(0.5)
    puts "(G)reen"
    sleep(0.5)
    puts "and (Y)ellow."
    sleep(0.5)
    print "Use (q)uit to end the game.\nWhat is your guess?\n> "
  end

  def guess_count
    @guess_count =+ 1
  end


  def guess_hint
    guess_count
    if guess_count > 1
      puts "'#{@input.upcase}' has #{@correct_colors} of the correct elements with #{@correct_position} in the correct position. You've taken #{@guess_count} guesses."
    else
      puts "'#{@input.upcase}' has #{@correct_colors} of the correct elements with #{@correct_position} in the correct position. You've taken #{@guess_count} guess."
    end
  end

  def end
    puts "Congratulations! You guessed the sequence '#{@elements.to_s.upcase}' in #{@guess_count} over #{@time_spent[0]} minutes and #{@time_spent[1]} seconds!"
    puts "Do you want to (p)lay again or (q)uit?"
  end

end

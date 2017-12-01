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
    sleep(0.75)
    puts ">"
    sleep(0.75)
    puts ">"
    sleep(0.75)
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    puts ">> "
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

  def instructions
    puts "The computer will generate a random four digit code consisting of the letters r, g, b, and y.\nYour job is to guess what the letters are and what order they are in\nFor example, if the code was \"rbbr\" and you guessed \"rrby\"\nThe game would tell you you had 2 correct colors in 2 correct positions\n"
  end

  def quit_print
    puts "Oh no, the fun has just begun!"
  end

  def cheat_print
    puts "Well fine then, don't be a good sport. The correct answer was '#{@elements.to_s.upcase}'. Enjoy knowing the game beat you."
  end

end

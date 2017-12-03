require "pry"
require_relative "check.rb"
require_relative "timer.rb"
require_relative "generate.rb"

class Sequence

  def start
    generate = Generate.new
    @elements = generate.easy
    puts "Welcome to MASTERMIND!"
    sleep(0.75)
    puts ">"
    sleep(0.75)
    puts ">"
    sleep(0.75)
    puts ">"
    sleep(0.75)
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print ">> "
    input = gets.chomp.downcase

    if input == "p" || input == "play"
      go_play
    elsif input == "q" || input =="quit"
      go_quit
    elsif input == "i" || input == "instructions" || input == "instruction" || input == "read" || input == "read the instructions"
      go_instruct
    else
      print "That was invalid input. You can (p)lay, read the (i)nstructions, or (q)uit.\n>> "
      input = gets.chomp.downcase
    end until input == "p" || input == "play" || input == "q" || input =="quit" || input == "i" || input == "instructions" || input == "instruction" || input == "read" || input == "read the instructions"
    go_play if input == "p" || input == "play"
    go_quit if input == "q" || input =="quit"
    go_instruct if input == "i" || input == "instructions" || input == "instruction" || input == "read" || input == "read the instructions"
  end

  def go_play
    @timer_start = Time.new.strftime("%s").to_i
    puts "I have generated a four letter sequence containing the following elements:"
    sleep(0.75)
    puts "(R)ed"
    sleep(0.75)
    puts "(G)reen"
    sleep(0.75)
    puts "(B)lue"
    sleep(0.75)
    puts "and (Y)ellow"
    sleep(0.75)
    print "Use (q)uit to stop the game. What is your guess?\n>> "
    go_repl
  end

  def go_repl
    check = Check.new
    puts @elements
    @guess = 0

    while @input = gets.chomp.downcase
      @guess += 1
      @check_colors = check.find_colors(@elements, @input)
      @check_position = check.find_position(@elements, @input)

      if @input.chars == @elements
        go_win
      elsif @input == "c" || @input == "cheat"
        puts "Oh, so you wanna play the game that way? The correct answer was #{@elements.join.upcase}, but don't you feel like you died a little inside?"
        break
      elsif @input == "q" || @input == "quit"
        break
      elsif @input.length > 4
        print "That was way too many letters. Try again.\n>> "
      elsif @input.length < 4
        print "One, two, three, four. That's how many letters you need. Try again.\n>> "
      elsif @input.chars != @elements && @guess == 1
        puts "'#{@input.upcase}' has #{@check_colors} of the correct elements with #{@check_position} in the correct positions."
        print "You have taken #{@guess} guess.\n>> "
      elsif @input.chars != @elements && @guess > 1
        puts "'#{@input.upcase}' has #{@check_colors} of the correct elements with #{@check_position} in the correct positions."
        print "You have taken #{@guess} guesses.\n>> "
      else
        print "Your input was unintelligible. I don't even know how you got to this message. Try again.\n>> "
      end
      go_quit if @input == "q" || @input == "quit"
    end
  end

  def go_instruct
    print "I will generate a random sequence of colors using their first initial.\nYour job is the guess the code. If the code was 'RBGY', you would win by entering 'RGBY'\nIf you enter 'RRBY', I will tell you that you have three correct colors with two in the correct position.\nAre you ready? Put (y)es to continue.\n>> "
    input = gets.chomp.downcase

      if input == "y" || input == "yes"
        puts "Back to the future!"
      else
        print "Unintelligible nonsense isn't my specialty. Type (y)es to continue.\n>> "
        input = gets.chomp.downcase
      end until input == "y" || input == "yes"
    start
  end

  def go_win
    timer = Timer.new
    timer_stop = Time.new.strftime("%s").to_i
    total_seconds = timer_stop - @timer_start
    minutes = total_seconds / 60
    seconds = total_seconds % 60
    time_spent = [minutes, seconds]
    puts "Congratulations! You guessed the sequence '#{@elements.join.upcase}' in #{@guess} guesses over #{time_spent[0]} minutes, #{time_spent[1]} seconds!"
    sleep(2)
    go_again
  end

  def go_again
    print "Do you want to (p)lay again or (q)uit?\n>> "
    input = gets.chomp.downcase

    if input == "p" || input == "play" || input == "again" || input == "play again"
      start
    elsif input == "q" || input == "quit"
      go_quit
    else
      puts "Your input was unintelligible. Try again."
      go_again
    end
  end

  def go_quit
    puts "Ok, I get it. You aren't a Mastermind. It's ok, it isn't like I worked hard to bring this experience to you. Goodbye."
  end
end

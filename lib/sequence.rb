require "pry"
require_relative "check.rb"
require_relative "timer.rb"
require_relative "generate.rb"

class Sequence
  check = Check.new
  timer = Timer.new
  generate = Generate.new
  @elements = generate.easy
  @check_colors = check
  @check_position = check

  def start
    @guess = 0
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
    @input = gets.chomp.downcase

    if @input == "p" || @input == "play"
      go_play
    elsif @input == "q" || @input =="quit"
      go_quit
    elsif @input == "i" || @inputs == "instructions" || @input == "instruction"
      go_instruct
    else
      puts "That was invalid input. Please try again"
      sleep(0.75)
      start
    end
  end

  def go_play
    timer = Timer.new
    @timer_start = timer.start
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
    timer
    go_repl
  end

  def timer
    time = Timer.new
    @time_start = time.start
  end

  def go_repl
      check = Check.new
      @input = gets.chomp.downcase
      check.find_colors(@elements, @input)
      check.find_position(@elements, @input)
      @guess += 1

      if @input.chars == @elements
        go_win
      elsif @input.length > 4
        print "That was way too many letters. Try again.\n>> "
        go_repl
      elsif @input.length < 4
        print "One, two, three, four. That's how many letters you need. Try again.\n>> "
        go_repl
      elsif @input == "c" || @input == "cheat"
        puts "Oh, so you wanna play the game that way? The correct answer was #{@elements.to_s.upcase}, but don't you feel like you died a little inside?"
      elsif @input == "q" || @input == "quit"
        go_quit
      elsif @input.chars != @elements && @guess < 1
        puts "'#{@elements.to_s.upcase}' has #{@check_colors} of the correct elements with #{@check_position} in the correct positions."
        print "You have taken #{@guess} guess.\n>> "
        go_repl
      elsif @input.chars != @elements && @guess > 1
        puts "'#{@elements.to_s.upcase}' has #{@check_colors} of the correct elements with #{@check_position} in the correct positions."
        print "You have taken #{@guess} guesses.\n>> "
        go_repl
      else
        print "Your input was unintelligible. I don't even know how you got to this message. Try again.\n>> "
        go_repl
      end
    end

  def go_quit
    puts "Ok, I get it. You aren't a Mastermind. It's ok, it isn't like I worked hard to bring this experience to you. Goodbye."
  end

  def go_instruct
    puts "I will generate a random sequence of colors using their first initial.\nYour job is the guess the code. If the code was 'RBGY', you would win by entering 'RGBY'\n If you enter 'RRBY', I will tell you that you have three correct colors with three in the correct position.\nAre you ready?"
    start
  end

  def go_win
    timer = Timer.new
    @timer_stop = timer.stop
    timer.time_spent(@time_start, @time_stop)
    puts "Congratulations! You guessed the sequence '#{@elements}' in #{@guess} guesses over #{@time_spent[0]} minutes, #{@time_spent[1]} seconds!"
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
      print "Your input was unintelligible. Try again\n>> "
      go_again
    end
  end
end 

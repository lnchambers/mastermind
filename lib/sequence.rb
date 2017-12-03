require "pry"
require "colorize"
require_relative "check.rb"
require_relative "timer.rb"
require_relative "generate.rb"

class Sequence

  def start
    generate = Generate.new
    @elements = generate.easy
    print "Welcome to"
    print " MASTERMIND!\n".colorize(:light_red)
    sleep(0.75)
    puts ">".colorize(:light_red)
    sleep(0.75)
    puts ">".colorize(:yellow)
    sleep(0.75)
    puts ">".colorize(:green)
    sleep(0.75)
    print "Would you like to "
    print "(p)lay, ".colorize(:green)
    print "read the "
    print "(i)nstructions, ".colorize(:yellow)
    print "or "
    print "(q)uit".colorize(:light_red)
    print "?\n"
    print ">> ".colorize(:green)
    input = gets.chomp.downcase

    if input == "p" || input == "play"
      go_play
    elsif input == "q" || input =="quit"
      go_quit
    elsif input == "i" || input == "instructions" || input == "instruction" || input == "read" || input == "read the instructions"
      go_instruct
    else
      print "That was invalid input. You can "
      print "(p)lay, ".colorize(:green)
      print "read the "
      print "(i)nstructions, ".colorize(:yellow)
      print "or "
      print "(q)uit".colorize(:light_red)
      puts "."
      print ">> ".colorize(:green)
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
    puts "(R)ed".colorize(:light_red)
    sleep(0.75)
    puts "(G)reen".colorize(:green)
    sleep(0.75)
    puts "(B)lue".colorize(:light_cyan)
    sleep(0.75)
    print "and"
    print " (Y)ellow\n".colorize(:yellow)
    sleep(0.75)
    print "Use "
    print "(q)uit ".colorize(:light_red)
    puts "to stop the game. What is your guess?"
    print ">> ".colorize(:green)
    go_repl
  end

  def go_repl
    check = Check.new
    @guess = 0

    while @input = gets.chomp.downcase
      @guess += 1
      @check_colors = check.find_colors(@elements, @input)
      @check_position = check.find_position(@elements, @input)

      if @input == "c" || @input == "cheat"
        go_cheat
        break
      elsif @input == "q" || @input == "quit"
        go_quit
        break
      elsif @input.chars == @elements
        go_win
        break
      elsif @input.length > 4
        puts "That was way too many letters. Try again."
        print ">> ".colorize(:green)
      elsif @input.length < 4
        puts "One, two, three, four. That's how many letters you need. Try again."
        print ">> ".colorize(:green)
      elsif @input.chars != @elements && @guess == 1
        puts "'#{@input.upcase}' has #{@check_colors} of the correct elements with #{@check_position} in the correct positions."
        puts "You have taken #{@guess} guess."
        print ">> ".colorize(:green)
      elsif @input.chars != @elements && @guess > 1
        puts "'#{@input.upcase}' has #{@check_colors} of the correct elements with #{@check_position} in the correct positions."
        puts "You have taken #{@guess} guesses."
        print ">> ".colorize(:green)
      else
        puts "Your input was unintelligible. I don't even know how you got to this message. Try again."
        print ">> ".colorize(:green)
      end
    end
  end

  def go_instruct
    print "I will generate a random sequence of colors using their first initial.\nYour job is the guess the code. If the code was 'RBGY', you would win by entering 'RGBY'\nIf you enter 'RRBY', I will tell you that you have three correct colors with two in the correct position.\nAre you ready? Put "
    print "(y)es ".colorize(:green)
    print "to continue.\n"
    print ">> ".colorize(:green)
    input = gets.chomp.downcase

      if input == "q" || input == "quit"
        go_quit
      else
        puts "Unintelligible nonsense isn't my specialty. Type (y)es to continue."
        print ">> ".colorize(:green)
        input = gets.chomp.downcase
      end until input == "y" || input == "yes" || input == "q" || input == "quit"
    start if input == "y" || input == "yes"
    go_quit if input == "q" || input == "quit"
  end

  def go_win
    timer = Timer.new
    timer_stop = Time.new.strftime("%s").to_i
    total_seconds = timer_stop - @timer_start
    minutes = total_seconds / 60
    seconds = total_seconds % 60
    time_spent = [minutes, seconds]
    print "Congratulations! ".colorize(:green)
    print "You guessed the sequence '#{@elements.join.upcase}' in #{@guess} guesses over #{time_spent[0]} minutes, #{time_spent[1]} seconds!\n"
    sleep(2)
    go_again
  end

  def go_again
    print "Do you want to "
    print "(p)lay ".colorize(:green)
    print "again or "
    print "(q)uit".colorize(:light_red)
    print "?\n"
    print ">> ".colorize(:green)
    input = gets.chomp.downcase

    if input == "p" || input == "play" || input == "again" || input == "play again"
      start
    elsif input == "q" || input == "quit"
      go_quit_end
    else
      puts "Your input was unintelligible. Try again."
      go_again
    end
  end

  def go_quit
    puts "Ok, I get it. You aren't a Mastermind. It's ok, it isn't like I worked hard to bring this experience to you. Goodbye."
  end

  def go_quit_end
    puts "Thank you for playing!"
  end

  def go_cheat
    puts "Oh, so you wanna play the game that way? The correct answer was #{@elements.join.upcase}, but don't you feel like you died a little inside?"
  end
end

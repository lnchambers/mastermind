require "pry"
require "colorize"
require_relative "check.rb"
require_relative "timer.rb"
require_relative "generate.rb"

class Sequence

  def start
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
    go_decision
  end

  def go_decision
    input_count = 0
    while input = gets.chomp.downcase
      input_count += 1
      if input == "p" || input == "play"
        go_play
        break
      elsif input == "q" || input =="quit"
        go_quit
        break
      elsif input == "i" || input == "instructions" || input == "instruction" || input == "read" || input == "read the instructions"
        go_instruct
        break
      elsif input_count > 10
        puts "It seems like you are having problems. Would you like to phone a friend? I'll wait."
        print ">> ".colorize(:green)
      else
        print "That was invalid input. You can "
        print "(p)lay, ".colorize(:green)
        print "read the "
        print "(i)nstructions, ".colorize(:yellow)
        print "or "
        print "(q)uit".colorize(:light_red)
        puts "."
        print ">> ".colorize(:green)
      end
    end
  end

  def go_play
    @elements = Generate.new.easy
    @timer_start = Timer.start
    puts "I have generated a four letter sequence (e.g. 'RGBY') containing the following elements:"
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
    @guess = 0

    while @input = gets.chomp.downcase
      @guess += 1
      @check_colors = Check.new.find_colors(@elements, @input)
      @check_position = Check.new.find_position(@elements, @input)

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
        puts "You put too many letter. The code is four letters long. Try again."
        print ">> ".colorize(:green)
      elsif @input.length < 4
        puts "You put too few letters. The code is four letters long. Try again"
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
    input_counter = 0
    print "I will generate a random sequence of colors using their first initial.\nYour job is the guess the code. If the code was 'RBGY', you would win by entering 'RBGY'\nIf you enter 'RRBY', I will tell you that you have three correct colors with two in the correct position.\nAre you ready? Put "
    print "(y)es ".colorize(:green)
    print "to play.\n"
    print ">> ".colorize(:green)

    while input = gets.chomp.downcase
      input_counter += 1
      if input == "q" || input == "quit"
        go_quit
        break
      elsif input == "y" || input == "yes"
        go_play
        break
      elsif input_counter >= 10
        puts "It seems you are having trouble. No matter, we'll start playing anyways. Good luck, seriously, you'll need it if you see this..."
        sleep(2.5)
        go_play
        break
      else
        print "Unintelligible nonsense isn't my specialty. Type "
        print "(y)es ".colorize(:green)
        puts "to play."
        print ">> ".colorize(:green)
      end
    end
  end

  def go_win
    @timer_stop = Timer.stop
    time_spent = Timer.time_spent(@timer_stop, @timer_start)
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

    while input = gets.chomp.downcase
      if input == "p" || input == "play" || input == "again" || input == "play again"
        go_play
        break
      elsif input == "q" || input == "quit"
        go_quit_end
        break
      else
        puts "Your input was unintelligible. Try again."
        print ">> ".colorize(:green)
      end
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

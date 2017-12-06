require "pry"
require "colorize"
require_relative "check.rb"
require_relative "timer.rb"
require_relative "generate.rb"
require_relative "printer.rb"

class Sequence

  def start
    Printer.start
    go_decision
  end

  def go_decision
    while input = gets.chomp.downcase
      if check_play(input)
        go_difficulty
        break
      elsif check_quit(input)
        go_quit
        break
      elsif check_instructions(input)
        go_instruct
        break
      else
        Printer.decision_invalid
      end
    end
  end

  def go_difficulty
    Printer.difficulty

    while @input = gets.chomp.downcase
      if check_hard(@input)
        @number_of_colors = "six"
        go_play
        break
      elsif check_medium(@input)
        @number_of_colors = "five"
        go_play
        break
      elsif check_easy(@input)
        @number_of_colors = "four"
        go_play
        break
      elsif check_if_god(@input)
        @number_of_colors = "six"
        go_play
        break
      elsif check_quit(input)
        go_quit
        break
      else
        Printer.difficulty_invalid
      end
    end
  end

  def go_play
    if check_easy(@input)
      @elements = Generate.new.easy
    elsif check_medium(@input)
      @elements = Generate.new.medium
    elsif check_hard(@input)
      @elements = Generate.new.hard
    else check_if_god(@input)
      @elements = Generate.new.stupid_hard
    end
    @timer_start = Timer.start
    Printer.play(@elements.count, @number_of_colors)
    go_repl
  end

  def go_repl
    @guess = 0
    while @input = gets.chomp.downcase
      @guess += 1
      @check_colors = Check.new.find_colors(@elements, @input)
      @check_position = Check.new.find_position(@elements, @input)

      if check_cheat(@input)
        go_cheat
        break
      elsif check_quit(@input)
        go_quit
        break
      elsif @input.chars == @elements
        go_win
        break
      elsif @input == "~godmode"
        go_win
        break
      elsif @input.length > @elements.count
        puts "You put too many letters. The code is #{@elements.count} letters long. Try again."
        print ">> ".colorize(:green)
      elsif @input.length < @elements.count
        puts "You put too few letters. The code is #{@elements.count} letters long. Try again"
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
    Printer.instructions

    while input = gets.chomp.downcase
      input_counter += 1
      if check_quit(input)
        go_quit
        break
      elsif check_yes(input)
        go_difficulty
        break
      elsif input_counter >= 10
        puts "It seems you are having trouble. No matter, we'll start playing anyways. Good luck, seriously, you'll need it if you see this..."
        sleep(2.5)
        go_difficulty
        break
      else
        Printer.instructions_invalid
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
    Printer.again

    while input = gets.chomp.downcase
      if check_play(input)
        go_difficulty
        break
      elsif check_quit(input)
        go_quit_end
        break
      else
        puts "Your input was unintelligible. Try again."
        print ">> ".colorize(:green)
      end
    end
  end

  def go_quit
    Printer.quit
  end

  def go_quit_end
    puts "Thank you for playing!"
  end

  def check_quit(input)
    input == "q" || input == "quit"
  end

  def check_play(input)
    input == "p" || input == "play" || input == "again" || input == "play again"
  end

  def check_yes(input)
    input == "y" || input == "yes"
  end

  def check_cheat(input)
    input == "c" || input == "cheat"
  end

  def check_instructions(input)
    input == "i" || input == "instructions" || input == "instruction" || input == "read" || input == "read the instructions"
  end

  def check_if_god(input)
    input == "i am a god!"
  end

  def check_hard(input)
    input == "h" || input == "hard"
  end

  def check_medium(input)
    input == "m" || input == "medium"
  end

  def check_easy(input)
    input == "c" || input == "cheat"
  end

  def go_cheat
    puts "Oh, so you wanna play the game that way? The correct answer was #{@elements.join.upcase}, but don't you feel like you died a little inside?"
  end
end

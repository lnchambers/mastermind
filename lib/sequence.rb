require "pry"
require_relative "check.rb"
require_relative "timer.rb"
require_relative "generate.rb"

class Sequence
  check = Check.new
  timer = Timer.new
  generate = Generate.new
  @timer_start = timer.start
  @timer_end = timer.stop

  @elements = generate.easy

  def start
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
    @timer_start
    puts "I have generated a four letter sequence containing the following elements:"
    sleep(0.75)
    puts "(R)ed"
    sleep(0.75)
    puts "(G)reen"
    sleep(0.75)
    puts "(B)lue"
    sleep(0.75)
    puts "and (Yellow)"
    sleep(0.75)
    print "Use (q)uit to stop the game. What is your guess?\n>> "
    @input = gets.chomp.downcase
  end
end

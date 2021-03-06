require "pry"
require "colorize"

class Printer

  def self.start
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
  end

  def self.decision_invalid
    print "That was invalid input. You can "
    print "(p)lay, ".colorize(:green)
    print "read the "
    print "(i)nstructions, ".colorize(:yellow)
    print "or "
    print "(q)uit".colorize(:light_red)
    puts "."
    print ">> ".colorize(:green)
  end

  def self.play(elements, number_of_colors)
    print "I have generated "
    print "a #{elements} letter sequence (e.g. 'RGBY' or 'RRBB'" if elements == 4
    print "a #{elements} letter sequence (e.g. 'RGBYPP' or 'RRBBPP'" if elements == 6
    print "an #{elements} letter sequence (e.g. 'RGBYPPWW' or 'RRBBPPWW'" if elements == 8
    print "a #{elements} letter sequence (e.g. EXAMPLE REDACTED: GODMODE ACTIVATED" if elements > 8
    print ") containing the following #{number_of_colors} elements :\n"
    sleep(0.75)
    puts "(R)ed".colorize(:light_red)
    sleep(0.75)
    puts "(G)reen".colorize(:green)
    sleep(0.75)
    puts "(B)lue".colorize(:light_cyan)
    sleep(0.75)
    puts "(P)urple".colorize(:light_magenta) if elements == 6 || elements >= 8
    sleep(0.75) if elements == 6 || elements >= 8
    puts "(W)hite".colorize(:white) if elements >= 8
    sleep(0.75) if elements >= 8
    print "and"
    print " (Y)ellow\n".colorize(:yellow)
    sleep(0.75)
    print "Use "
    print "(q)uit ".colorize(:light_red)
    puts "to stop the game. What is your guess?"
    print ">> ".colorize(:green)
  end

  def self.instructions
    print "I will generate a random sequence of colors using their first initial.\nYour job is the guess the code. If the code was 'RBGY', you would win by entering 'RBGY'\nIf you enter 'RRBY', I will tell you that you have three correct colors with two in the correct position.\nAre you ready? Put "
    print "(y)es ".colorize(:green)
    print "to play.\n"
    print ">> ".colorize(:green)
  end

  def self.instructions_invalid
    print "Unintelligible nonsense isn't my specialty. Type "
    print "(y)es ".colorize(:green)
    puts "to play."
    print ">> ".colorize(:green)
  end

  def self.quit
    print "Ok, I get it. You aren't a "
    print "MASTERMIND".colorize(:light_red)
    print ". It's ok, it isn't like I worked hard to bring this experience to you. Goodbye.\n"
  end

  def self.difficulty
    puts "There are three difficulties :"
    sleep(0.5)
    puts "(H)ard".colorize(:light_red)
    sleep(0.5)
    puts "(M)edium".colorize(:yellow)
    sleep(0.5)
    print "and "
    print "(E)asy\n".colorize(:green)
    sleep(0.5)
    puts "Which difficulty would you like to play on?"
    print ">> ".colorize(:green)
  end

  def self.difficulty_invalid
    print "That was invalid input. You can choose "
    print "(h)ard".colorize(:light_red) + ", "
    print "(m)edium".colorize(:yellow) + ", and "
    print "(e)asy".colorize(:green) + ".\n"
    print ">> ".colorize(:green)
  end

  def self.again
    print "Do you want to "
    print "(p)lay ".colorize(:green)
    print "again or "
    print "(q)uit".colorize(:light_red)
    print "?\n"
    print ">> ".colorize(:green)
  end
end

require "generate"

class Setup

  puts "Welcome to MASTERMIND/n/nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  input = gets.chomp.downcase

  def initialize
    generate = Generate.new
  end

require "pry"

class Timer

attr_reader :time_spent

  def initialize
    @seconds = 0
    @minutes = 0
  end

  def self.start
    start = Time.new.strftime("%s").to_i
  end

  def self.stop
    stop = Time.new.strftime("%s").to_i
  end

  def self.time_spent(stop, start)
    total_seconds = stop - start
    @minutes = total_seconds / 60
    @seconds = total_seconds % 60
    time_spent = [@minutes, @seconds]
  end
end

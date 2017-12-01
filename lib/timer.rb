require "pry"

class Timer

attr_reader :start,
            :stop,
            :time_spent

  def initialize
    @start = nil
    @stop = nil
    @seconds = 0
    @minutes = 0
  end

  def start
    @start = Time.new.strftime("%s")
  end

  def stop
    @stop = Time.new.strftime("%s")
  end

  def time_spent
    @minutes = ((@stop.to_i - @start.to_i) / 60).to_i
    @seconds = (@stop.to_i - @start.to_i) - (@minutes * 60).to_i
    time_spent = [@minutes, @seconds]
  end
end

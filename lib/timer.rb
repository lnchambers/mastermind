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
    @start = Time.new.strftime("%s").to_i
  end

  def stop
    @stop = Time.new.strftime("%s").to_i
  end

  def time_spent
    total_seconds = @stop - @start
    @minutes = total_seconds / 60
    @seconds = total_seconds % 60
    time_spent = [@minutes, @seconds]
  end
end

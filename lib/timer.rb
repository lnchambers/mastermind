require "pry"

class Timer

  def initialize
    @start
    @stop
    @seconds
    @minutes
  end

  def start
    @start = Time.now
  end

  def stop
    @stop = Time.now
  end

  def minutes
    @minutes = (stop - start) / 60
  end

  def seconds
    @seconds = stop - start
  end

end

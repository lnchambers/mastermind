require "pry"
require "timecop"

class Timer

attr_reader :start
attr_reader :stop

  def initialize
    @start
    @stop
    @seconds
    @minutes
  end

  def minutes
    @minutes = (stop - start) / 60
  end

  def seconds
    @seconds = stop - start
  end

  def start
    @start = Time.now
  end

  def stop
    @stop = Time.now
  end

end

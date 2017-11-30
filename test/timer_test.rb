require "minitest/autorun"
require "minitest/pride"
require "./lib/timer"
require "pry"
require "timecop"

class TimerTest < Minitest::Test

  def test_it_exists
    timer = Timer.new

    assert_instance_of Timer, timer
  end

  def test_it_accepts_starts_time
    time = Timer.new

    start = time.start

    assert_equal start, start
  end

  def test_it_accepts_stop_time
    time = Timer.new

    stop = time.stop

    assert_equal stop, stop
  end

end

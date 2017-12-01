require "minitest/autorun"
require "minitest/pride"
require "./lib/timer"
require "pry"

class TimerTest < Minitest::Test

  def test_it_exists
    timer = Timer.new

    assert_instance_of Timer, timer
  end

  def test_it_accepts_starts_time
    time = Timer.new

    start = time.start

    assert_equal Time.new.strftime("%s").to_i, start
  end

  def test_it_accepts_stop_time
    time = Timer.new

    stop = time.stop

    assert_equal Time.new.strftime("%s").to_i, stop
  end

  def test_it_outputs_time_spent
    time = Timer.new

    start = time.start
    sleep(1)
    stop = time.stop
    time_spent = time.time_spent

    assert_equal [0, 1], time_spent
  end

  def test_it_outputs_correct_time_long
    skip
    time = Timer.new

    start = time.start
    sleep(301)
    stop = time.stop
    time_spent = time.time_spent

    assert_equal [5, 1], time_spent
  end
end

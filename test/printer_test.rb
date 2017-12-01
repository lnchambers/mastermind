require "minitest/autorun"
require "minitest/pride"
require "./lib/printer"

class PrinterTest < Minitest::Test

  def test_it_exists
    printer = Printer.new("rggy", 3, 3, ["r", "g", "g", "y"], [4, 25])

    assert_instance_of Printer, printer
  end

  def test_it_prints_begin
    printer = Printer.new("rggy", 3, 3, ["r", "g", "g", "y"], [4, 25])

    printer = printer.begin

    assert_includes "MASTERMIND", printer
  end

  def test_it_prints_sequence
    printer = Printer.new("rggy", 3, 3, ["r", "g", "g", "y"], [4, 25])

    printer = printer.sequence

    assert_includes ["generated", "sequence"], printer
  end

  def test_guess_count
    printer = Printer.new("rggy", 3, 3, ["r", "g", "g", "y"], [4, 25])

    printer = printer.guess_count

    assert_equal 1, printer
  end

  def test_it_prints_guess_hint_with_variables
    printer = Printer.new("rggy", 3, 3, ["r", "g", "g", "y"], [4, 25])

    printer = printer.guess_hint

    assert_includes ["'RGGY'", "3"], printer
  end

  def test_it_prints_end_with_variables
    printer = Printer.new("rggy", 3, 3, ["r", "g", "g", "y"], [4, 25])

    printer = printer.begin

    assert_includes ["4", "25"], printer
  end

end

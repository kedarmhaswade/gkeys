#!/usr/bin/env ruby
require "test/unit"
require_relative "../shortcut_source"
require_relative "../shortcut"

class ShortcutSourceTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_dummy_source
    test_src = ShortcutSource.new("test software")
    test_sc_1 = Shortcut.new("Ctrl+H", "Show Hierarchy")
    test_sc_2 = Shortcut.new("Ctrl+O", "Open File ...")
    test_src << test_sc_1 << test_sc_2
    assert_equal(test_sc_1.keystroke, test_src["hier"][0])
    assert_equal(test_sc_2.keystroke, test_src["file"][0])
    assert_equal(test_sc_2.keystroke, test_src["open"][0])
  end
end
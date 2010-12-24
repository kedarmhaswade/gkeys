#!/usr/bin/env ruby
require "test/unit"
require_relative "../shortcut"

class ShortcutTest < Test::Unit::TestCase

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
  def test_ctor
    sc = Shortcut.new("Ctrl+O", "open file")
  end
end

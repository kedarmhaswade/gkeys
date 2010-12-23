#!/usr/bin/env ruby

# An abstraction for a shortcut. A shortcut is a mapping between a keystroke (we call Ctrl+O as one keystroke) and
# its function.
class Shortcut
  attr_reader :keystroke, :function
  def initialize(keys, function)
    @keystroke = keys
    @function = function
  end
end
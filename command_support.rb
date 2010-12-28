#!/usr/bin/env ruby

# Models the support that command needs in order to execute
class CommandSupport
  attr_accessor :line_arguments, :current_program, :known_programs

  def initialize
    @line_arguments = [] # avoid checking and NilClass by "contract"
  end
end
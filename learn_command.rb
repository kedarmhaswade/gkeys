#!/usr/bin/env ruby
require_relative "command_support"
require_relative "base_command"
require_relative "result"

class LearnCommand
  # implements the "learn" command

    def initialize
      super("learn")
    end

    def run(support)
      #support will never be null
      return Failure.new("Usage: learn <URL, file path etc. to learn a software keyboard shortcuts from>") unless support.line_arguments[0]
      io = get_io(support.line_arguments[0])
      begin
      rescue

      end
    end

    def get_io(url)
      
    end
end


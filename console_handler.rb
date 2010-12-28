#!/usr/bin/env ruby

require_relative "command_support"
require_relative "base_command"

# Handles the interaction with console. This is the main driver of the program
class ConsoleHandler
  attr_reader :input, :output

  def initialize(input=$stdin, output=$stdout)
    @input  = input
    @output = output
  end

  def run
    support = CommandSupport.new
    @output.puts get_banner
    @output.print get_prompt
    while true
      possibly_partial_name = get_cmd_name_and_configure_support(input.gets.chomp, support)
      command = Command.get(possibly_partial_name)
      result = command.run support
      @output.puts(get_formatted_message(result.message))
      break if(possibly_partial_name =~ /\A(q[uit]*)|(exi[t]*)\Z/i)
      @output.puts "\n"
      @output.print get_prompt
    end
  end

  def get_formatted_message(msg)
#    msg = get_prompt + msg
#    msg.gsub!(/\n/, "\n"+get_prompt)
    msg # no formatting at the moment
  end

  def get_prompt
    "gk> "
  end

  def get_banner
    "Welcome to gkeys. Type h[elp] for help."
  end

  def get_cmd_name_and_configure_support(line, support)
    parts = line.scan(/\w+/)
    return nil unless parts
    support.line_arguments = parts[1..-1] #remaining arguments except the cmd name
    parts[0]
  end

end
#!/usr/bin/env ruby

require_relative "result"
require_relative "persistable"
require_relative "not_yet_implemented"

class Command
  include Persistable, NotYetImplemented

  @@initialized_table = false

  def self.get(possibly_partial_name)
    initialize_commands_table
    probable_commands = []
    @@commands.each_pair do |cmd_name, cmd|
      probable_commands << cmd if cmd_name =~ /^#{possibly_partial_name}/i
    end
    if probable_commands.size == 1
      return probable_commands[0]
    elsif probable_commands.empty?
      return @@commands[nil]
    else
      return AmbiguousCommand.new(possibly_partial_name, probable_commands)
    end
  end

  def self.initialize_commands_table
    require_relative "concrete_commands"

    unless @@initialized_table
      @@commands  = {
        "examples" => ExamplesCommand.new,
        "help"     => HelpCommand.new,
        "keys"     => KeysCommand.new,
        "learn"    => LearnCommand.new,
        "list"     => ListCommand.new,
        "quit"     => QuitCommand.new,
        "show"     => ShowCommand.new,
        "tips"     => TipsCommand.new,
        "use"      => UseCommand.new,
        nil        => NilCommand.new,
      }
      @@initialized_table = true
    end

  end

  attr_reader :name


  def initialize(name)
    @name = name
  end

end

#!/usr/bin/env ruby

# Models a software program
class Program
  # To change this template use File | Settings | File Templates.
end

class ShortcutSource < Program
  attr_reader :name

  def initialize(name)
    @name = name
    @map  = Hash.new
  end

  def <<(shortcut)
    @map[shortcut.keystroke] = shortcut
    self
  end

  def -(shortcut_with_keys)
    @map.delete(shortcut_with_keys)
  end

  def add(keys, function)
    self.<<(Shortcut.new(keys, function))
  end

  def delete(keys)
    self.- keys
  end

  # the "index" is a regex, returns an array of all keystrokes whose values "match" given regex. Never returns nil.
  def [](str)
    keystrokes = Array.new
    regex = /#{str}/i
    @map.each_pair do |keystroke, shortcut| # each_value is the keystroke (key)
      keystrokes << keystroke if shortcut.function =~ regex
    end
    keystrokes
  end

  def get_shortcut_for(regex)
    self.[](regex)
  end
  
end

#!/usr/bin/env ruby

require_relative "base_command"
require_relative "not_yet_implemented"

class HelpCommand < Command

  def initialize
    super("help")
  end

  def run(support)
    help_text = <<-HERE
----> gkeys learns and teaches keyboard shortcuts of any software program. It encourages use of
----> keyboard over mouse when possible. See https://github.com/kedarmhaswade/gkeys#readme
----> h[elp]           -- prints this help page
----> exa[mples]       -- shows example usage
----> le[arn] <url>    -- learns the shortcuts from this url, can be a local file too
----> li[st]           -- lists names of currently learned software programs
----> k[eys] <regex>   -- shows the shortcut for the actions identified by <regex>
----> s[how] <strokes> -- shows function the pressed keys correspond to, if any (also shows what you pressed)
----> t[ips] <number>  -- shows <number> __random__ shortcuts for current software program (with a delay)
----> u[se] <name>     -- uses <name> software program as "current software program"
----> q[uit] or exi[t] -- quits
    HERE
    Success.new(help_text)
  end
end

class QuitCommand < Command
  def initialize(name="quit")
    super(name)
  end

  def run(support)
    Success.new("Bye! Happy keyboarding!")
  end
end

class ExitCommand < QuitCommand
  def initialize
    super("exit")
  end
end

class NilCommand < Command
  def initialize
    super("null")
  end

  def run(support)
    Failure.new("No such command. Try help.")
  end
end

class ExamplesCommand < Command
  def initialize
    super("examples")
  end

  def run(support)
    some_text = <<-HERE
----> Loaded [firefox, chrome, intellij, vim] shortcuts
gk> k open
----> Open File = Ctrl + O
----> Open URL  = Ctrl + L
....
gk> use firefox
----> now showing firefox shortcuts
gk> keys close
....
gk> use intellij
----> now showing intellij shortcuts
gk> use rubym
----> now showing rubymine shortcuts
gk> use vim
----> now showing vim shortcuts
gk> learn http://support.mozilla.com/en-US/kb/keyboard%20shortcuts
----> learned the keyboard shortcuts for Firefox Support (will overwrite these from local store if you save)
gk> learn shortcuts.txt
----> learned the keyboard shortcuts for ...
gk> list
----> [firefox, chrome, intellij, rubymine]
gk> help
----> h[elp]           -- prints this help page
----> exa[mples]       -- shows example usage
----> le[arn] <url>    -- learns the shortcuts from this url, can be a local file too
----> li[st]           -- lists names of currently learned software programs
----> k[eys] <regex>   -- shows the shortcut for the actions identified by <regex>
----> s[how] <strokes> -- shows function the pressed keys correspond to, if any (also shows what you pressed)
----> t[ips] <number>  -- shows <number> __random__ shortcuts in current software program (with a delay)
----> u[se] <name>     -- uses <name> software program as "current software program"
----> q[uit] or exi[t] -- quits
gk> quit
----> Save? (Y/n)
Bye. Happy keyboarding!
    HERE
    Success.new(some_text)
  end
end


class ListCommand < Command
  include NotYetImplemented

  def initialize
    super("list")
  end
end

class KeysCommand < Command
  include NotYetImplemented

  def initialize
    super("keys")
  end

end

class ShowCommand < Command
  include NotYetImplemented

  def initialize
    super("keys")
  end

end

class TipsCommand < Command
  include NotYetImplemented

  def initialize
    super("tips")
  end

end

class UseCommand < Command
  include NotYetImplemented

  def initialize
    super("use")
  end

end

class AmbiguousCommand < Command
  attr_reader :probable_commands

  def initialize(name, probable_commands) # name can be anything
    super(name)
    @probable_commands = probable_commands
  end

  def run(support)
    names   = @probable_commands.map { |cmd| cmd.name }.join(", ")
    message = "#{@name} is ambiguous. Matches [#{names}]. Please be specific."
    Failure.new(message)
  end
end

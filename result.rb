#!/usr/bin/env ruby

# denotes the result of command run
class Result
  SUCCESS = 0
  FAILURE = 1

  attr_reader :message, :code

  def initialize(message, code=SUCCESS)
    @message = message
    @code    = code
  end

  def success?
    @code == SUCCESS
  end

  def failure?
    !success?
  end

  def to_s
    "message: #{message}\ncode: #{code}"
  end

end

class Success < Result
  def initialize(message)
    super(message, SUCCESS)
  end
end

class Failure < Result
  def initialize(message)
    super(message, FAILURE)
  end
end
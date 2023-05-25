require './nameable'

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# CapitalizeDecorator class
class CapitalizeDecorator < Decorator
  def correct_name
    nameable.correct_name.capitalize
  end
end

# TrimmerDecorator class
class TrimmerDecorator < Decorator
  MAX_LENGTH = 10

  def correct_name
    name = nameable.correct_name
    name.length > MAX_LENGTH ? name[0, MAX_LENGTH] : name
  end
end

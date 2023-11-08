# frozen_string_literal: true

# Specific Error if details are requested from empty HTML document
class HTMLIsEmptyError < StandardError
  def initialize(message)
    super(message)
  end
end

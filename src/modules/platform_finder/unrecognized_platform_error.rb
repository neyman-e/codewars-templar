# frozen_string_literal: true

# Specific error if a given platform can't be extracted
class UnrecognizedPlatformError < StandardError
  def initialize(message)
    super(message)
  end
end

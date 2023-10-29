# frozen_string_literal: true

# Specific Error for InvalidUrlInput
class InvalidInputError < StandardError
  def initialize(message)
    super(message)
  end
end

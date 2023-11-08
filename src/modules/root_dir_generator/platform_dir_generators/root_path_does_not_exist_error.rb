# frozen_string_literal: true

# Error for when the root directy does not exist
class RootPathDoesNotExistError < StandardError
  def initialize(message)
    super(message)
  end
end

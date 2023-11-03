# frozen_string_literal: true

require_relative 'unrecognized_platform_error'

# Functionality for extracting the name of the problem platform
class PlatformFinder
  def self.determine_platform(platform_url)
    if platform_url.include?('codewars')
      'codewars'
    else
      raise UnrecognizedPlatformError, "The platform in the url #{platform_url} is not supported"
    end
  end
end

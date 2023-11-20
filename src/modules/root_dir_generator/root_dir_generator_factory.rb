# frozen_string_literal: true

require_relative 'platform_dir_generators/codewars_root_dir_generator'

# create a rootdirgenerator for a given code-problem platform
class RootDirGeneratorFactory
  def self.create_generator(problem_platform)
    case problem_platform
    when 'codewars'
      CodewarsRootDirGenerator.new
    else
      raise NotImplementedError, 'Not supported'
    end
  end
end

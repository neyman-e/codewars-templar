# frozen_string_literal: true

require_relative 'codewars_problem_parser'

class CodeProblemParserFactory
  def self.create_parser(problem_platform)
    case problem_platform
    when 'codewars'
      CodewarsCodeProblemParser.new
    else
      raise NotImplementedError, "No Parser for this platform '#{problem_platform}' exists yet"
    end
  end
end

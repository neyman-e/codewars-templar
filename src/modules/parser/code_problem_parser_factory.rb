# frozen_string_literal: true

class CodeProblemParserFactory

  def self.create_parser(problem_platform)
    case problem_platform
    when 'codewars'
      return CodewarsProblemParser.new
    else
      raise NotImplementedError, "#{problem_platform} is not supported (yet)"
    end
  end
end

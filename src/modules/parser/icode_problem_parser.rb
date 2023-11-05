# frozen_string_literal: true

# Code Problem Parser Interface
class ICodeProblemParser
  def parse_page
    raise NotImplementedError, 'Interface method is not implemented'
  end

  def problem_details
    raise NotImplementedError, 'Interface method is not implemented'
  end
end

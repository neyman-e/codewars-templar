# frozen_string_literal: true

# Code Problem Parser Interface
class ICodeProblemParser
  def parse_page
    raise NotImplementedError, 'Subclasses must implement this method'
  end

  def problem_details
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end

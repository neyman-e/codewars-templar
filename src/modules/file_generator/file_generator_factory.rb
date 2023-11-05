# frozen_string_literal: true

class FileGeneratorFactory
  def create_generator(problem_lang)
    case problem_lang
    when 'ruby'
      RubyFileGenerator.new
    else
      raise NotImplementedError, "Templating is not supported for '#{problem_lang}'"
    end
  end
end

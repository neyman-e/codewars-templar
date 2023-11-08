# frozen_string_literal: true

require_relative 'language_file_generators/ruby_file_generator'

# Create a FileGenerator for a specific language
class LanguageFileGeneratorFactory
  def self.create_generator(problem_lang)
    case problem_lang
    when 'ruby'
      RubyFileGenerator.new
    else
      raise NotImplementedError, 'Not supported'
    end
  end
end

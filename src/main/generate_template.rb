# frozen_string_literal: true

require 'yaml'

require_relative '../modules/platform_finder/platform_finder'
require_relative '../modules/platform_finder/unrecognized_platform_error'

require_relative '../modules/parser/code_problem_parser_factory'
require_relative '../modules/parser/html_is_empty_error'

# require_relative '../modules/file_generator/file_generator_factory'

def main

  # Open user config to access stuff
  user_config = YAML.load_file(File.absolute_path(File.dirname(__FILE__) + '/../../config/my_config.yml'))

  # TODO: Maybe implement MVC as to not bloat this main? would prob need a router and "model" is not clear
  # TODO: Catching errors is there but they are not actually handled
    # there could also be some mini-logging implementation
  # TODO: Sanitize input when used in shell command-execution and handle errors
  # TODO: After catching an error at a given position, continue execution at a reasonable point (Exception Handling)
  loop do

    begin
      puts 'What is the url of the code-problem?'
      problem_url = gets.chomp
      problem_platform = PlatformFinder.determine_platform(problem_url)
    rescue UnrecognizedPlatformError => e
      puts "An error occured: #{e.message}"
    end

    # TODO: Handle Exception if there user-input is invalid
    begin
      puts 'Which language would you like to train in?'
      puts 'Enter the corresponding number'

      langs_with_templates = user_config.reject { |key, value| key == 'settings' }.keys
      langs_with_templates.each_with_index do |lang, index|
        puts "#{index + 1} - #{lang}"
      end

      problem_lang = langs_with_templates[gets.chomp.to_i - 1]

    # TODO: Does not do anything right now
    rescue StandardError => e
      puts "An error occured: #{e.message}"
    end

    # TODO: Does Platform-Language Combination exist for this problem?
    # scrape code-problem details from the url for given language
    # TODO Catch and handle selenium errors (Invalid urls, non-existing language etc.)
    begin
      parser = CodeProblemParserFactory.create_parser(problem_platform)
      parser.parse_page(problem_url, problem_lang)
      problem_information = parser.problem_details
    rescue HTMLIsEmptyError => e
      puts "An error occured: #{e.message}"
    end

    # generate the templates for kata and user language
    begin
      file_generator = FileGeneratorFactory.create_generator(problem_lang)
      file_generator.generate_template_files(problem_information)
    rescue StandardError => e
      puts "An error occured: #{e.message}"
    end
  end
end

main

# frozen_string_literal: true

require_relative '../modules/platform_finder/platform_finder'
require_relative '../modules/platform_finder/unrecognized_platform_error'

require_relative '../modules/parser/code_problem_parser_factory'
# require_relative '../modules/file_generator/file_generator_factory'


def main

  # TODO: Catching errors is there but they are not actually handled
  # TODO: Sanitize input when used in shell command-execution and handle errors
  # TODO: After catching an error at a given position, continue execution at a reasonable point
  while true

    begin
      puts 'What is the url of the code-problem?'
      problem_url = gets.chomp
      problem_platform = PlatformFinder.determine_platform(problem_url)
    rescue UnrecognizedPlatformError => e
      puts "An error occured: #{e.message}"
    end

    # TODO: Is language supported?
    # TODO: Is platform-language combination supported?
    begin
      puts 'Which language would you like to train in?'
      problem_lang = gets.chomp
    rescue StandardError => e
      puts "An error occured: #{e.message}"
    end

    # TODO: Does Platform-Language Combination exist for this problem?
    # scrape code-problem details from the url for given language
    begin
      parser = CodeProblemParserFactory.create_parser(problem_platform)
      parser.parse_page(problem_url, problem_lang)
      problem_information = parser.problem_details
    rescue StandardError => e
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

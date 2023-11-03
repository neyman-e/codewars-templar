# frozen_string_literal: true

def main

  # TODO: Sanitize input when used in shell command-execution
  while true
    puts 'What is the url of this kata (the "train" link)?'
    problem_url = gets.chomp

    puts 'Which language would you like to train in?'
    problem_url = gets.chomp

    # scrape kata details from the url
    begin
      parser = CodeProblemParserFactory.create_parser(problem_url)
      parser.scrape_page
      problem_information = parser.get_problem_details
    rescue
      "An error occured #{e.message}"
    end

    # generate the templates for kata and user language
    begin
      file_generator = FileGeneratorFactory.create_generator(problem_url)
      file_generator.generate_template_files(problem_information)
    rescue
      "An error occured #{e.message}"
    end
  end
end

main

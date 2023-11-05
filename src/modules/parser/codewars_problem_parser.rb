# frozen_string_literal: true

require 'selenium-webdriver'
require 'nokogiri'

require_relative 'html_is_empty_error'

# Parser for Codewars Problems (aka Katas)
class CodewarsProblemParser
  def initialize
    options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    @driver = Selenium::WebDriver.for :chrome, options: options
    @html = String.new # TODO: No consistent type with Nokogiri::HTML; nokogiri type that supports empty check?
  end

  def parse_page(problem_url, problem_lang)
    # GET url and parse using Nokogiri

    doc = retrieve_problem_html(problem_url, problem_lang)

    @html = Nokogiri::HTML(doc)
  end

  def problem_details
    # returns a hash of code problem details

    raise HTMLIsEmptyError, 'No html file exists, did you retrieve data from url first?' if @html.empty?

    problem_details = Hash.new

    problem_details[:title] = @html.search('#shell_content h4.ml-2.mb-3').text
    problem_details[:difficulty] = @html.search('#shell_content .inner-small-hex').first.text[0].to_i
    problem_details[:description] = @html.xpath('//*[@id="description"]').to_html

    problem_details[:code_window_content] = extract_code_window_content('method')
    problem_details[:test_window_content] = extract_code_window_content('test')

    problem_details
  end

  private

  # TODO: Catch and handle errors with selenium
  # get page content
  def retrieve_problem_html(problem_url, problem_lang)

    full_url = "#{problem_url}/train/#{problem_lang}"

    @driver.get(full_url)

    # wait to allow for JS execution
    sleep(5)

    @driver.page_source
    @driver.quit
  end

  def extract_code_window_content(window_type)
    # get pre-written base-code or tests for solution

    code_window = @html.search('.CodeMirror-code')

    content = StringIO.new

    case window_type
    when 'method'
      code_window[0].search('-CodeMirror-line').each { |line| content.push(line.text) }
    when 'test'
      code_window[1].search('-CodeMirror-line').each { |line| content.push(line.text) }
    end

    content.string
  end
end

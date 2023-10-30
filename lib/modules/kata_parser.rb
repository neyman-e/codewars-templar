require 'selenium-webdriver'
require 'nokogiri'

require_relative 'invalid_input_error'

# Searches for info about a codewars kata at a given location
class KataParser
  attr_reader :kata_title, :kata_difficulty, :kata_description, :kata_code, :kata_tests

  def initialize(lang_specific_html)
    # guard for invalid inputs TODO: Test
    raise InvalidInputError, 'URL is not from codewars' unless lang_specific_html.include?('codewars.com')

    @lang_specific_html = lang_specific_html
    options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    @driver = Selenium::WebDriver.for :chrome, options: options
  end

  def extract_kata_information

    doc = retrieve_kata_html

    extract_basic_info(doc)

    extract_code_info(doc)
  end

  private

  def retrieve_kata_html
    # start selenium browser session
    @driver.get(@lang_specific_html)

    # wait to guarantee for JS to load
    sleep(5)

    # get doc and quit driver
    html_content = @driver.page_source
    @driver.quit

    return Nokogiri::HTML(html_content)
  end

  def extract_basic_info(html_doc)
    # get title, difficulty and description
    @kata_title = html_doc.search('#shell_content h4.ml-2.mb-3').text
    @kata_difficulty = html_doc.search('#shell_content .inner-small-hex').first.text[0].to_i
    @kata_description = html_doc.xpath('//*[@id="description"]').to_html
  end

  def extract_code_info(html_doc)
    # get tests and pre-written base-code for solution

    code_windows = html_doc.search('.CodeMirror-code')

    @kata_code = ""
    code_windows[0].search('.CodeMirror-line').each do |line|
      @kata_code << "#{line.text}\n"
    end

    @kata_tests = ""
    code_windows[1].search('.CodeMirror-line').each do |line|
      @kata_tests << "#{line.text}\n"
    end
  end
end

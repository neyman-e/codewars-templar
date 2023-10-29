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

    # start selenium browser session
    @driver.get(@lang_specific_html)

    # wait to guarantee for JS to load
    sleep(5)

    html_content = @driver.page_source
    @driver.quit

    doc = Nokogiri::HTML(html_content)

    @kata_title = doc.search('#shell_content h4.ml-2.mb-3').text
    @kata_difficulty = doc.search('#shell_content .inner-small-hex').first.text[0].to_i
    # TODO: Get full description and code content (move to a JS-executing URI-opener?)
    @kata_description = doc.xpath('//*[@id="description"]').to_html

    code_windows = doc.search('.CodeMirror-code')

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

# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

# Searches for info about a codewars kata at a given location
class KataParser
  attr_reader :kata_title, :kata_difficulty, :kata_description, :kata_method_name, :kata_tests

  def initialize(lang_specific_html)
    @lang_specific_html = lang_specific_html
  end

  def parse_kata
    doc = File.open(@lang_specific_html) { |f| Nokogiri::HTML(f) }

    @kata_title = doc.search('#shell_content h4.ml-2.mb-3').text
    @kata_difficulty = doc.search('#shell_content span').first.text[0].to_i

    # TODO: Get full description and code content (move to a JS-executing URI-opener?)
    @kata_description = ''
    @kata_method_name = 0
    @kata_tests = 0
  end
end

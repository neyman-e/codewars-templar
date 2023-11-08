# frozen_string_literal: true

require 'yaml'

require_relative '../modules/kata_parser.rb'
require_relative '../modules/directory_helper'

def main
  # get user input
  puts 'What is the url of this kata (the "train" link)?'
  kata_url = gets.chomp

  # retrieve kata information
  parser = KataParser.new(kata_url)
  parser.extract_kata_information
  kata_information = parser.summary

  # create directories as specified in config
  template_creator = DirectoryHelper.new(kata_information)
  template_creator.create_files
end

main

# vs_code_open = %x{code #{home_path}#{CONFIG['settings']['path']}}

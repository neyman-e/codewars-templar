# frozen_string_literal: true

require 'yaml'

home_path = ENV['HOME']
user = ENV['USER']

config = YAML.load_file("config/#{user}.yml")
puts "Path: #{home_path}#{config['settings']['path']}"

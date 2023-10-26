# frozen_string_literal: true

require 'rspec'
require_relative '../lib/modules/kata_parser'

# Testing Setup
example_1_ruby_html = File.absolute_path('spec/resources/01-80skids/ruby-train.html')
test_parser = KataParser.new(example_1_ruby_html)

# example_2_ruby_html = File.absolute_path('spec/resources/02-find-the-smallest/ruby-train.html')

describe 'Kata Parser' do
  describe '#parse_kata' do
    it 'should parse the html-file at base_kata_url' do
      expect { test_parser.parse_kata }.not_to raise_error
    end

    it 'should extract the title' do
      expect(test_parser.kata_title).to eq('80\'s Kids #6: Rock \'Em, Sock \'Em Robots')
    end

    it 'should extract the difficulty' do
      expect(test_parser.kata_difficulty).to eq(5)
    end
  end
end

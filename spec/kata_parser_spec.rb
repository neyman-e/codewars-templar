# frozen_string_literal: true

require 'rspec'
require_relative '../lib/modules/kata_parser'

### Testing Setup
# get test results
train_language = 'ruby'
eightees_kids_url = 'https://www.codewars.com/kata/566b490c8b164e03f8000002'
find_smallest_url = 'https://www.codewars.com/kata/573992c724fc289553000e95'

stitched_eightees_url = 'https://www.codewars.com/kata/566b490c8b164e03f8000002/train/ruby'
stitched_smallest_url = 'https://www.codewars.com/kata/573992c724fc289553000e95/train/ruby'

eightess_kids_desc = File.open(File.absolute_path('spec/resources/01-80skids/description.md')).read
eightess_kids_code = File.open(File.absolute_path('spec/resources/01-80skids/code.rb')).read
eightess_kids_tests = File.open(File.absolute_path('spec/resources/01-80skids/tests.rb')).read

find_smallest_desc = File.open(File.absolute_path('spec/resources/02-find-the-smallest/description.md')).read
find_smallest_code = File.open(File.absolute_path('spec/resources/02-find-the-smallest/code.rb')).read
find_smallest_tests = File.open(File.absolute_path('spec/resources/02-find-the-smallest/tests.rb')).read

# invalid_urls = ['NOT_A_VALID_URL', 'https://www.google.com']

# Setup the parsers
eightees_parser = KataParser.new(stitched_eightees_url)
find_smallest_parser = KataParser.new(stitched_smallest_url)

describe 'Kata Templar' do
  # Test Information Extraction
  describe 'KataParser' do
    describe '#extract_kata_information' do
      it 'should successfully parse the html file without error' do
        expect { eightees_parser.extract_kata_information }.not_to raise_error
        expect { find_smallest_parser.extract_kata_information }.not_to raise_error
      end

      it 'should extract the title' do
        expect(eightees_parser.kata_title).to eq('80\'s Kids #6: Rock \'Em, Sock \'Em Robots')
        expect(find_smallest_parser.kata_title).to eq('Find the smallest')
      end

      it 'should extract the difficulty' do
        expect(eightees_parser.kata_difficulty).to eq(5)
        expect(find_smallest_parser.kata_difficulty).to eq(5)
      end

      it 'should extract the kata description' do
        expect(eightees_parser.kata_description).to eq(eightess_kids_desc)
        expect(find_smallest_parser.kata_description).to eq(find_smallest_desc)
      end

      it 'should extract the kata code-sample' do
        expect(eightees_parser.kata_code).to eq(eightess_kids_code)
        expect(find_smallest_parser.kata_code).to eq(find_smallest_code)
      end

      it 'should extract the kata tests' do
        expect(eightees_parser.kata_tests).to eq(eightess_kids_tests)
        expect(find_smallest_parser.kata_tests).to eq(find_smallest_tests)
      end
    end
  end
end

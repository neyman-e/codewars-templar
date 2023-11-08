# frozen_string_literal: true

require_relative 'ilanguage_file_generator'

# generate files and directories for solving problems in ruby
class RubyFileGenerator < ILanguageFileGenerator

  def generate_files(problem_information, problem_dir_path, user_config)

    @root_dir = problem_dir_path

    @kata_description = problem_information[:description]
    @code_content = problem_information[:code_window_content]
    @test_content = problem_information[:test_window_content]

    user_config['ruby'].each { |entry| generate_dirs_and_files(entry) }
  end

  private

  def generate_dirs_and_files(node, base_path = @root_dir)

    path = File.join(base_path, node['name'])

    # if directory, recusive call ourselves
    if node['type'] == 'directory'
      Dir.mkdir(path) unless Dir.exist?(path)

      node['contents'].each { |child_node| generate_dirs_and_files(child_node, path) }

    # if file, create file and fill it with content
    else
      if node['content_source'] == 'user'
        File.write(path, node['contents'])
      else
        File.write(path, get_file_content(node))
      end
    end
  end

  def get_file_content(yaml_entry)
    case yaml_entry['content_source']
    when 'code_content'
      @code_content
    when 'test_content'
      @test_content
    when 'readme'
      @kata_description
    end
  end
end

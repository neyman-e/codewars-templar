# frozen_string_literal: true

require_relative 'iplatform_root_dir_generator'

require_relative 'root_path_does_not_exist_error'

# generate root directory structure for problems from codewars
class CodewarsRootDirGenerator < IPlatformRootDirGenerator
  attr_reader :problem_dir

  def generate_dir_structure(path_info, kata_information)

    root_dir = path_info['root_path']
    codewars_dir = File.join(root_dir, path_info['codewars_path'])

    # general root dir
    raise RootPathDoesNotExist, 'Please create the root directory' unless Dir.exist?(root_dir)

    # codewars root
    Dir.mkdir(codewars_dir) unless Dir.exist?(codewars_dir)

    # difficulty wrapper directory
    kata_diff_dir = File.join(codewars_dir, "#{kata_information[:difficulty]}kyu")
    Dir.mkdir(kata_diff_dir) unless Dir.exist?(kata_diff_dir)

    # kata numbering
    problem_dir_name = get_kata_dir_path(kata_information[:title], kata_diff_dir) # TODO: do without instance vars
    @problem_dir = File.join(kata_diff_dir, problem_dir_name)
    Dir.mkdir(@problem_dir) unless Dir.exist?(@problem_dir)
  end

  private

  def get_kata_dir_path(kata_title, problem_root_path)
    # create name for kata directory
    kata_title = kata_title.downcase.split
    dir_name = kata_title.each { |word| word.gsub!(/[^a-z0-9\-\_]/, '') }.join('-')

    # get next number and prefix
    dir_contents = Dir.entries(problem_root_path)
    next_number = dir_contents.select { |entry| File.directory?('./') && !entry.include?('.') }.size + 1
    next_number > 9 ? prefix = next_number : prefix = "0#{next_number}"

    # create final path
    problem_dir_name = "#{prefix}-#{dir_name}"
  end
end

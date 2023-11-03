
# functionalities for creating directories and files from user config
class DirectoryHelper
  def initialize(kata_information={})
    # open user config
    @config = YAML.load_file(File.absolute_path('config/my_config.yml'))
    @kata_information = kata_information
    @base_dir_name = ''
  end

  def create_files
    # create base directory
    create_base_kata_dir

    # get number-order prefix & create kata dir
    create_kata_directory

    # create all directories
    create_all_dirs

    # create files according to user config
    create_user_files
  end

  private

  # create base directory unless it exists
  # TODO: Handle the directoryexists error
  def create_base_kata_dir
    @base_dir_name = File.join(@config['settings']['path'], "#{@kata_information[:diff]}kyu")
    unless Dir.exist?(@base_dir_name)
      Dir.mkdir(@base_dir_name)
      puts "Created new level folder #{@base_dir_name}"
    end
  end

  # Create Kata Directory
  #
  # Cleans the kata name by downcasing and removing all special characters, except '-' and '_', keeping numbers
  # creates directory with numbered prefix
  def create_kata_directory
    # get name for kata directory
    kata_title = @kata_information[:title].downcase.split
    dir_name = kata_title.each { |word| word.gsub!(/[^a-z0-9\-\_]/, '') }.join('-')

    # get next number and prefix
    dir_contents = Dir.entries(@base_dir_name)
    next_number = dir_contents.select { |entry| File.directory?('./') && !entry.include?('.') }.size + 1
    next_number > 9 ? prefix = next_number : prefix = "0#{next_number}"

    # create final path and create directories
    @kata_path = "#{@base_dir_name}/#{prefix}-#{dir_name}"
    Dir.mkdir(File.absolute_path(@kata_path))
  end

  def create_all_dirs
    dirs = []
    @config['files'].each_value { |value| dirs << value['rel_path'] unless dirs.include?value['rel_path'] }

    dirs.sort.each do |dir|
      Dir.mkdir(File.join(@kata_path, dir)) unless File.exist?(File.join(@kata_path, dir))
      puts "Created #{File.join(@kata_path, dir)}"
    end
  end

  def create_user_files
    # for each file that the user wants
    @config['files'].each_pair do |file_identifier, file|

      # create full path
      full_path = File.join(@kata_path, file['rel_path'], file['filename'])

      # if file should be filled with scraped info (matching key check), write this to file, else write user-content
      if @kata_information.key?(file_identifier.to_sym)
        File.write(full_path, @kata_information[file_identifier.to_sym])
      else
        File.write(full_path, file['content'])
      end

      puts "Created #{full_path}"
    end
  end
end

require 'yaml'

# The computer's home path
home_path = Dir.home
# the system's username
user = ENV['USER']
# Configuration file for the specific user
CONFIG = YAML.load_file("config/#{user}.yml")

# Exits the script if the input is wrong, after giving a message to the user
def abort_script(message)
  puts "Script ABORTED: #{message}"
  exit
end

# Returns the kata's level after asking the user for it
#
# 1st ask user's input to specify the kata's level
# 2nd check if what we are getting is really an integer and in the correct range (1 to 8)
#     If it is correct, return what the user gave as input
#     If it isn't, give a message to the user and terminate the script
def define_level
  print "What is the level of the kata (1-8)? "
  level = gets.chomp.to_i
  if level.is_a?(Integer) && level > 0 && level < 9
    level
  else
    abort_script("Terminating... Wrong input")
  end
end

# Creates the kata level folder '*kyu' if it doesn't exist and print a message
def kata_level_folder(level_folder_path)
  unless Dir.exist?(level_folder_path)
    Dir.mkdir(level_folder_path)
    puts "Created new level folder #{level_folder_path}"
  end
end

# It counts the katas done for the specific level,
# getting as argument the folder path for that specific level
#
# 1st assign to an array +files_and_folders+ all the strings with the name of all files and directories in the folder
# 2nd return the size of the array, once we select all the directories, excluding the special ones "." and ".."
def count_done_katas(level_folder_path)
  files_and_folders = Dir.entries(level_folder_path)
  files_and_folders.select { |entry| File.directory?(File.join(level_folder_path, entry)) && entry != "." && entry != ".."  }.size
end

# Defines the kata name
#
# Gives a hint on the maximum possible characters after having calculated it
# Cleans the kata name by downcasing and removing all special characters, except '-' and '_', keeping numbers
# Checks if the input was valid and if it isn't, it terminates the script giving a message to the user
def get_name(level_folder_path)
  max_name_length = [255 - level_folder_path.length - 25, 100].min  # 255 is the maximum path length and 25 a safety measure
  puts "How do you want to name the kata?"
    puts "(Special characters except '-' and '_' will be removed and the maximum characters are #{max_name_length})"
    print "Kata name: "
  input_name = gets.chomp.downcase.split
  clean_name = input_name.each { |word| word.gsub!(/[^a-z0-9\-\_]/, '') }.join('-')
  if clean_name.length < max_name_length
    clean_name
  else
    abort_script("Terminating... Wrong input")
  end
end


# Creates the kata's folder structure
#
# 1- Defines the destination folder path, depending on how many katas have been done at a particular level
#   (maximum is 99 katas for each level)
# 2- Checks if the folder exists already (the kata could have already been attempted), aborting the script
#   with a message
# 3- If the folder doesn't exist, it creates all folders listed in the config file
# 4- Finally it returns the folder path
def create_folders(level_folder_path, number, kata_name)
  folder_path = "#{level_folder_path}#{number > 9 ? number : "0#{number}"}-#{kata_name}"                            # 1
  if Dir.entries(level_folder_path).any? { |entry| entry.include?(kata_name) }                                      # 2
  abort_script("This kata already exists in your folders")
  else                                                                                                              # 3
    folders = []
    CONFIG['files'].each_value { |value| folders << value['rel_path'] unless folders.include?value['rel_path'] }
    folders.sort.each do |folder|
      Dir.mkdir(File.join(folder_path, folder))
      puts "Created folder #{File.join(folder_path, folder)}"
    end
  end
  folder_path                                                                                                       # 4
end

# Creates all files in the corresponding folder, writing in it the content defined in the YML config file.
#
# It also prints a success message for every file
def create_files(folder_path)
  CONFIG['files'].each_value do |file|
    full_path = File.join(folder_path, file['rel_path'], file['filename'])
    File.write(full_path, file['content'])
    puts "Create file #{full_path}"
  end
end

level = define_level
level_folder_path = "#{home_path}#{CONFIG['settings']['path']}/#{level}kyu/"

kata_level_folder(level_folder_path)

files_count = count_done_katas(level_folder_path)

kata_name = get_name(level_folder_path)
folder_path = create_folders(level_folder_path, files_count + 1, kata_name)

create_files(folder_path)

vs_code_open = %x{code #{home_path}#{CONFIG['settings']['path']}}
puts "VS Code is now open" if vs_code_open

# frozen_string_literal: true

# Interface for all Root Directory Generators
class IPlatformRootDirGenerator
  attr_reader :problem_dir

  # def initialize # (user_config)
    # raise NotImplementedError, 'Subclasses must implement this method'
  # end

  def generate_dir_structure
    @problem_dir = String.new # Must set instance var of problem-directory
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end

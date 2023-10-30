# frozen_string_literal: true

# Check if dependencies for scraping are met
class DependencyChecker
  def self.dependencies_installed?
    required_packages = ['chromium-chromedriver']

    # Check if required packages are installed (supress dpkg output using dev/null)
    missing_packages = required_packages.reject do |package|
      system("dpkg -l | grep #{package} > /dev/null 2>&1")
    end

    # if there are missing packages return false and print hint
    unless missing_packages.empty?
      puts "Packages are missing: #{missing_packages.join(', ')}"
      puts "They can be installed using the instructions in the documentation (README.md)"
      return false
    end

    return true
  end
end

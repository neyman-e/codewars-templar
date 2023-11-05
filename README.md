# Code Wars TEMPLAteRS

We're the Code Wars Knight Templars. We're gonna fight the code wars as the best and most respectful Knight Templars ever, creating a nice parser which dynamically automates the creation of each and everyone of our Codewars kata folders, with the use of our TEMPLAteR swords.

[Just if you don't know what a Knight Templar is](https://en.wikipedia.org/wiki/Knights_Templar)

---

# General Info

This project is WIP and at the moment requires exection of source-code scripts.
Only MVP-like functionality exists.

You can scrape data from the following
  - `codewars.com`

You can generate files for the following languages:
  - `ruby`

More languages and problem-solving-platforms will be supported in the future.

## Installation

To retrieve all required information from the kata-URL, selenium-webdriver is needed, which in turn needs chromedriver.

Install needed dependencies (selenium-webdriver) using

`bundle install`

## Basic Usage

#### Setup

1. Copy/Paste or rename `config/config_template.yml` to `config/my_config.yml`
2. Fill in the absolute filepath to where you want your files to go (root dir)
3. Adjust other settings and filenames as needed, following the structure provided in `config/config_template.yml`
  - Create Template for filestructure and file-content for the languages you want to solve problems in

#### Usage

1. Execute the templating script (from the root dir) using

    `ruby src/main/generate_template.rb`

2. Enter the url to a code problem

      e.g. `https://www.codewars.com/kata/566b490c8b164e03f8000002`

3. Choose the language you want to solve the problem in

4. Start working on your solution

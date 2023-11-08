# Code Wars TEMPLAteRS

We're the Code Wars Knight Templars. We're gonna fight the code wars as the best and most respectful Knight Templars ever, creating a nice parser which dynamically automates the creation of each and everyone of our Codewars kata folders, with the use of our TEMPLAteR swords.

[Just if you don't know what a Knight Templar is](https://en.wikipedia.org/wiki/Knights_Templar)

---

## Installation

To retrieve all required information from the kata-URL, selenium-webdriver is needed, which in turn needs chromedriver.

Install needed dependencies (selenium-webdriver) using

`bundle install`

## Basic Usage

#### Setup

1. Copy/Paste or rename `config/config_template.yml` to `config/my_config.yml`
2. Fill in the absolute filepath to where you want your files to go
3. Adjust other settings and filenames as needed

#### Usage

1. Execute the templating script using

    `ruby lib/main/init_kata.rb`

2. Enter the url to a codewars kata (important: including the `train/ruby` suffix)

      e.g. `https://www.codewars.com/kata/566b490c8b164e03f8000002/train/ruby`

3. Start working on your kata solution

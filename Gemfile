source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
# gem 'sqlite3', '~> 1.4'
gem 'mysql2', '>= 0.4.4', '<= 0.8.27'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'active_storage_validations', '0.8.2'
gem 'image_processing', '1.9.3'
gem 'mini_magick', '4.9.5'
gem 'sprockets', '~> 3.7.2'
gem 'aws-sdk-s3', require: false

gem 'bootsnap', '>= 1.4.4', require: false

gem "bcrypt"
gem "rails-i18n"
gem "kaminari"
gem "kaminari-i18n"
gem "date_validator"
gem "valid_email2"
gem "nokogiri"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", '~> 4.0.0'
  gem "factory_bot_rails"
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'pre-commit'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'launchy'
  gem 'webdrivers'
  gem 'poltergeist'
end
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.4'
# gem 'sqlite3', '~> 1.4'
gem 'active_storage_validations', '0.8.2'
gem 'aws-sdk-s3', require: false
gem 'image_processing', '1.9.3'
gem 'jbuilder', '~> 2.7'
gem 'mini_magick', '4.9.5'
gem 'mysql2'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'sprockets', '~> 3.7.2'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

gem 'bootsnap', '>= 1.4.4', require: false

gem 'bcrypt'
gem 'date_validator'
gem 'kaminari'
gem 'kaminari-i18n'
gem 'nokogiri'
gem 'rails-i18n'
gem 'valid_email2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 4.0.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'web-console', '>= 4.1.0'
  # gem 'spring'
  gem 'pre-commit'
  gem 'rubocop'
  gem 'rubocop-discourse'
  gem 'rubocop-rails'
  # gem 'spring-commands-rspec'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'launchy'
  gem 'poltergeist'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

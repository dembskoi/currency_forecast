source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.4'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use PostgreSQL as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# Flexible authentication solution for Rails
gem 'devise'
# Enable Slim as the templating engine
gem 'slim-rails'
# Bootstrap 4 ruby gem for Ruby on Rails (Sprockets) and Compass
gem 'bootstrap', '~> 4.0.0.alpha6'
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end
# Heroku assets support
gem 'rails_12factor', group: :production
# HTTP client lib
gem 'faraday'

group :development do
  gem 'listen', '~> 3.0.5'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # This gem implements the rspec command for Spring
  gem 'spring-commands-rspec'
end
group :development, :test do
  # Pretty print your Ruby objects with style in full color and with proper indentation
  gem 'awesome_print'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # A Ruby static code analyzer, based on the community Ruby style guide
  gem 'rubocop', require: false
  # Factory
  gem 'factory_girl_rails'
  # Easily generate fake data
  gem 'faker'
  # Testing framework
  gem 'rspec-rails'
end
group :test do
  # For integration testing
  gem 'capybara'
  # Strategies for cleaning databases in Ruby
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  # https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers'
end

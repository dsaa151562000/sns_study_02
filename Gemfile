source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
<<<<<<< HEAD
gem 'rails', '4.0.5'
=======

gem 'rails', '4.2.3'

>>>>>>> 8481cb1a9cd71a4da2e589a4e2ea44dd44b348bf

# Use sqlite3 as the database for Active Record
#gem 'sqlite3'

gem 'sqlite3', groups: %w(test development), require: false

gem 'pg', '0.15.1', groups: %w(production), require: false

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'bcrypt-ruby', '3.1.2'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'bootstrap-sass', '2.3.2.0'

gem 'will_paginate', '3.0.4'

gem 'bootstrap-will_paginate', '0.0.9'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  #gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2' #Heroku 上で動作できるように、Rails の動作を変更します
end


group :development, :test do
gem "rspec-rails", "~> 3.1.0"
gem "factory_girl_rails", "~> 4.4.1"
end

group :test do
gem "faker", "~> 1.4.3"
gem "capybara", "~> 2.4.3"
gem "database_cleaner", "~> 1.3.0"
gem "launchy", "~> 2.4.2"
gem "selenium-webdriver", "~> 2.43.0"
end
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

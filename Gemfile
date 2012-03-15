source 'http://rubygems.org'

gem 'rails', '3.2.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3-ruby', :require => 'sqlite3'

gem 'haml'

gem 'bson'
gem 'mongo'
gem 'mongoid', :git => 'git://github.com/mongoid/mongoid.git'
gem 'bson_ext'
gem "bcrypt-ruby", :require => "bcrypt"
gem "cancan"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '~> 1.2.3'
  gem 'eco'

  gem 'jquery-rails'
end

group :development, :test do
  gem 'rspec', '~> 2.8'
  gem 'rspec-rails'
  gem 'mongoid-rspec', :git => 'git://github.com/shingara/mongoid-rspec.git', :branch => 'mongoid-2.0.0.rc1'
  gem 'rspec-given'
  gem 'database_cleaner'
  gem 'cucumber'
  gem "cucumber-rails", "~> 1.0", require: false  
  gem 'capybara-webkit'
  gem 'selenium-webdriver'  
  gem 'jasmine-rails'
  gem 'jasmine-headless-webkit', "~> 0.9.0.rc1"

  gem 'guard-rails-assets'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-jasmine-headless-webkit', "~> 0.4.0.rc1"

  gem 'growl'
  gem 'rb-fsevent'

  gem 'spork'
  gem 'guard-spork'
end

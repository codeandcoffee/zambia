source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'eco'

  gem 'jquery-rails'
  gem 'rails-backbone'
end

group :development, :test do
  gem 'ruby-debug19'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'capybara-webkit'

  gem 'jasmine-headless-webkit'

  gem 'guard-rails-assets'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-jasmine-headless-webkit'

  if RUBY_PLATFORM =~ /darwin/
    gem 'growl_notify'
    gem 'rb-fsevent'
  end
end



# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'


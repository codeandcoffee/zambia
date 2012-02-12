require 'cucumber/rails'

Capybara.default_selector = :css
ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end


Capybara.register_driver :selenium do |app|
 Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

if ENV['CAPYBARA_ENV_TYPE'] == 'HEADLESS'
  Capybara.javascript_driver = Capybara.default_driver = :akephalos
else
  Capybara.javascript_driver = Capybara.default_driver = :selenium
end

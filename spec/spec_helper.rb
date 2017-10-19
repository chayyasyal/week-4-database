ENV['RACK_ENV'] = 'test'
require 'capybara/rspec'
# require 'simplecov'
# require 'simplecov-console'
require 'rspec'
# require_relative '../app.rb'
require_relative '../models/link'
require_relative '../app.rb'
require 'database_cleaner'

# require
# require File.join(File.dirname(__FILE__), ‘..’, ‘app.rb’)

Capybara.app = BookmarkManager

RSpec.configure do |config|
  # Everything in this block runs once before all the tests run

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # Everything in this block runs once before each individual test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Everything in this block runs after each individual test
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

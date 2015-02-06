ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# Code Climate test coverage
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Devise helper
  class ActionController::TestCase
    include Devise::TestHelpers
  end
end

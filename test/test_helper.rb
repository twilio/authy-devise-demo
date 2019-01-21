ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def form_authenticity_token(body)
    regex = /type="hidden" name="authenticity_token" value="(?<token>.+)"/
    parts = response.body.match(regex)
    parts['token'] if parts
  end
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end
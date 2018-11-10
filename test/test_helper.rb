ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
	include Sorcery::TestHelpers::Rails::Integration
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...

   def login_admin(user, route)
    # post the login and follow through
    post route, params: { email: user.email,
      password: "password" }
   end
end

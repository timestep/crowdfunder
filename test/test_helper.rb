ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
	ActiveRecord::Migration.check_pending!
end

class ActionDispatch::IntegrationTest
	include Capybara::DSL
	Capybara.app = Crowdfunder::Application

	teardown do 
		Capybara.reset_sessions! # Forget the (simulated) browser state
		Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
	end

end


ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
	teardown do 
		DatabaseCleaner.clean
	end
end

DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest

	include Capybara::DSL

	Capybara.app = Crowdfunder::Application

	Capybara.javascript_driver = :webkit

	self.use_transactional_fixtures = false

	setup do 
		reset_email
	end


	teardown do 
		DatabaseCleaner.clean
		Capybara.reset_sessions! # Forget the (simulated) browser state
		Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
	end

	def setup_signed_in_user
		pass = 'this-is-a-password'
		user = FactoryGirl.create :user, password: pass
		visit '/sessions/new'

		fill_in 'email', with: user.email
		fill_in 'password', with: pass
		click_button "Login"

		user
	end

	def last_email 
		ActionMailer::Base.deliveries.last
	end

	def reset_email
		ActionMailer::Base.deliveries = []
	end
end


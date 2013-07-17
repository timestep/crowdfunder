ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
	ActiveRecord::Migration.check_pending!
end

class ActionDispatch::IntegrationTest
	include Capybara::DSL
	Capybara.app = Crowdfunder::Application
end
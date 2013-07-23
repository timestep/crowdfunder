require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Crowdfunder
  class Application < Rails::Application
  	
    config.generators do |g|
      g.test_framwork :test_unit, :fixture => false
      g.fixture_replacement :factory_girl, :dir => "test/factories"
    end
  end
end

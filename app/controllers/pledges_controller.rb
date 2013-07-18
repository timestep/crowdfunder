class PledgesController < ApplicationController

	before_filter :require_login
	before_filter :require_project

	def new
	end

	def create
	end
	
end

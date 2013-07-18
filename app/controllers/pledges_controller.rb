class PledgesController < ApplicationController

	before_filter :require_login
	before_filter :require_project

	def new
	end

	def create
	end

	private

	def require_project
		@project = Project.find params[:project_id]
	end
end

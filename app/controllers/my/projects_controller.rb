class My::ProjectsController < ApplicationController

	before_filter :require_login
	before_filter :require_project, except: [:index,:new,:create]

	def index
		@projects = Project.all
	end

	def new 
	end

	def create
	end
	
	def edit
	end	

	private

	def require_project
		@project = current_user.projects.find params[:id]
	end


end
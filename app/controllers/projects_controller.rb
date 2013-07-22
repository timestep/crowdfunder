class ProjectsController < ApplicationController
	def index
		@projects = Project.order('project.created_at DESC').page(params[:page]).per(8)
	end
	def show
		@project = Project.find(params[:id])
	end
end

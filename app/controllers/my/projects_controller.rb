class My::ProjectsController < ApplicationController

	before_filter :require_login
	before_filter :require_project, except: [:index,:new,:create]

	def index
		@projects = current_user.projects.load
	end

	def new 
		@project = current_user.projects.build
	end

	def create
		@project = current_user.projects.build params[:project]
		if @project.save
			redirect_to [:my, :projects], notice: 'Project created!'
		else
			render :new
		end
	end
	
	def edit
	end	

	def update
		
		if @project = update_attributes params[:project]
			redirect_to [:my, :projects], notice: 'Project updated!'
		else
			render :edit
		end
	end

	private

	def require_project
		@project = current_user.projects.find params[:id]
	end


end
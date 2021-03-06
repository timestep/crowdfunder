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
		@project = current_user.projects.build(project_params)
		if @project.save
			redirect_to my_projects_path, notice: 'Project created!'
		else
			render :new
		end
	end
	
	def edit
	end	

	def update
		if @project.update_attributes(project_params)
      redirect_to my_projects_path, notice: "Project updated!"
    else
      render :edit
    end
	end

	def destroy
		@project.destroy
		redirect_to [:my, :projects], notice: "deleted"
	end

	private

	def require_project
		@project = current_user.projects.find_by_id params[:id]
		if @project.nil?
			flash[:alert] = "doesn't exist"
			redirect_to root_path
		else
			@project
		end
	end

	def project_params
		params.require(:project).permit!
	end

end
class My::ImagesController < ApplicationController

	before_filter :require_login
	before_filter :require_project

  def index
  end

  def create
  end

  private

  def require_project
  	@project = current_user.projects.find params[:project_id]
  end

end

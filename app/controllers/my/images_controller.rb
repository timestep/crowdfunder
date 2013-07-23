class My::ImagesController < ApplicationController

	before_filter :require_login
	before_filter :require_project

  def index
    @images = @project.images.all
    @image = @project.images.build
  end

  def create
    @image = @project.images.build(params_images)
    if @image.save
      redirect_to [:my, @project, :images], notice: "Image uploaded. Check it out below."
    else
      @images = @project.images.order(:id)
      render :index
    end
  end

  private

  def require_project
  	@project = current_user.projects.find params[:project_id]
  end

  def params_images
    params.require(:image).permit!
  end
end

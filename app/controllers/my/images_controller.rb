class My::ImagesController < ApplicationController


	before_filter :require_project

  def index
    @images = @project.images.where(file: true).load
    @image = @project.images.build
  end

  def create
    @image = @project.images.build(params_images)
    if @image.save
      redirect_to my_project_images_path(@project), notice: "Image uploaded. Check it out below."
    else
      redirect_to my_project_images_path(@project), alert: 'not allowed'
    end
  end

  private

  def require_project
  	@project = current_user.projects.find params[:project_id]
  end

  def params_images
    params.require(:image).permit(:file)
  end
end

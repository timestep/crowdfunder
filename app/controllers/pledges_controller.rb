class PledgesController < ApplicationController

	before_filter :require_login
	before_filter :require_project

	def new
		@pledge = @project.pledges.build
	end

	def create

		@pledge = @project.pledges.build pledge_params
		@pledge.user = current_user

		if @pledge.save
			redirect_to @project, notice: "Thanks for pledging"
			UserMailer.new_pledge(current_user).deliver
		else
			render :new
		end
	end

	private

	def pledge_params
		params.require(:pledge).permit!
	end

	def require_project
		@project = Project.find params[:project_id]
	end
end

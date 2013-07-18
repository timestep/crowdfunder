class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	
  	if @user.save
  		auto_login(@user)
  		redirect_to root_url, :notice => "Account created"
  	else
  		redirect_to '/users'
  	end
  end

  private

  def user_params
  	params.require(:user).permit!
  end

end

class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_pledge(pledge)
  	@user = pledge.user
  	mail(to: @user.email)
  end
end

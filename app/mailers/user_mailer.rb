class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_pledge(pledge)
  	@user = pledge.project.user
  	mail(to: @user.email, subject: "Your project recieved some backing on CrowdFunder." )
  end
end

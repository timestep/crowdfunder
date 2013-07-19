class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_pledge(user)
  	@user = user
  	mail(to: @user.email)
  end
end

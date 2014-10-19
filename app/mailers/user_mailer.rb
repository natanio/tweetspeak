class UserMailer < ActionMailer::Base
  ADMIN_ADDRESS = "Tweet Speak English <members@tweetspeakenglish.com>"
  default :from => ADMIN_ADDRESS

  def welcome_email(user)
  	@user = user
  	@url = 'https://tweetspeakenglish.com/users/sign_in'
  	mail(to: @user.email, subject: 'Welcome to Tweet Speak English!')
  end
end

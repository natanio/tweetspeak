class UserMailer < ActionMailer::Base
  ADMIN_ADDRESS = "Tweet Speak English <members@tweetspeakenglish.com>"
  default :from => ADMIN_ADDRESS

  def welcome_email(user)
  	@user = user
  	@url = 'https://tweetspeakenglish.com/users/sign_in'
  	mail(to: @user.email, subject: 'Welcome to Tweet Speak English!')
  end

  def remind_of_trial(user)
  	@user = user
  	@url = 'https://tweetspeakenglish.com/users/sign_in'
  	mail(to: @user.email, subject: 'Start Your Free 7-Day Trial')
  end

  def no_trial_feedback(user)
  	@user = user
  	@url = 'https://tweetspeakenglish.com/users/sign_in'
  	mail(to: @user.email, subject: 'Your Free Trial is Still Waiting')
end

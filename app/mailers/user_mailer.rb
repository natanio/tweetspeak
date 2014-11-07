class UserMailer < ActionMailer::Base
  ADMIN_ADDRESS = "Tweet Speak English <members@tweetspeakenglish.com>"
  default :from => ADMIN_ADDRESS

  def welcome_email(user)
  	@user = user
  	@url = 'https://tweetspeakenglish.com/users/sign_in'
  	mail(to: @user.email, subject: 'Welcome to Tweet Speak English!')
  end

  def trial_day_1(user)
  	@user = user
  	@url = 'https://tweetspeakenglish.com/users/sign_in'
  	mail(to: @user.email, subject: 'How to Study English Every Day')
  end

  def trial_day_2(user)
    @user = user
    @url = 'https://tweetspeakenglish.com/dashboard'
    mail(to: @user.email, subject: 'Listening is key')
  end

  def trial_day_3(user)
    @user = user
    @url = 'https://tweetspeakenglish.com/users/sign_in'
    mail(to: @user.email, subject: 'Connect your mouth to your ears')
  end

  def trial_day_4(user)
    @user = user
    @url = 'https://tweetspeakenglish.com/users/sign_in'
    mail(to: @user.email, subject: "Understanding comes with time, don't give up!")
  end

  def trial_day_5(user)
    @user = user
    @url = 'https://tweetspeakenglish.com/users/sign_in'
    mail(to: @user.email, subject: "How to improve your spoken English")
  end

  def trial_day_6(user)
  	@user = user
  	@url = 'https://tweetspeakenglish.com/users/sign_in'
    @twitter = 'http://twitter.com/tweetspeakeng'
    @facebook = 'http://facbook.com/TweetSpeakEnglish'
    @blog = 'http://blog.tweetspeakenglish.com'
  	mail(to: @user.email, subject: 'Today is the last day of your trial')
  end
end

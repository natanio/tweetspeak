namespace :reminders do
  desc "Send reminders - should be triggered once a day"
  task :daily => :environment do
    # Courtesy message sent out about starting free trial send out after 2 days from signup.
    User.where("created_at < ? and created_at > ?", 2.days.ago.at_midnight, 3.days.ago.at_midnight).each do |user|
      unless user.active_subscription?
        puts "sending 'start trial' reminder to user #{user.id}"
        UserMailer.remind_of_trial(user).deliver!
      end
    end

    # Second courtesy message a week after still no trial activity
    User.where("created_at < ? and created_at > ?", 7.days.ago.at_midnight, 8.days.ago.at_midnight).each do |user|
      unless user.active_subscription?
        puts "sending 'trial is waiting' reminder to user #{user.id}"
        UserMailer.no_trial_feedback(user).deliver!
      end
    end
  end
end
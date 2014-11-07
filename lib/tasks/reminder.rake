namespace :reminders do
  desc "Send reminders - should be triggered once a day"
  task :daily => :environment do
    # Educate user of our process, and how to use the site
    User.where("trial_began < ? and trial_began > ?", 1.days.ago.at_midnight, 2.days.ago.at_midnight).each do |user|
      unless user.active_subscription?
        puts "sending 'Day 1' email to user #{user.id}"
        UserMailer.trial_day_1(user).deliver!
      end
    end

    # Second educational email
    User.where("trial_began < ? and trial_began > ?", 2.days.ago.at_midnight, 3.days.ago.at_midnight).each do |user|
      unless user.active_subscription?
        puts "sending 'Day 2' email to user #{user.id}"
        UserMailer.trial_day_2(user).deliver!
      end
    end

    # Third educational email
    User.where("trial_began < ? and trial_began > ?", 3.days.ago.at_midnight, 4.days.ago.at_midnight).each do |user|
      unless user.active_subscription?
        puts "sending 'Day 3' email to user #{user.id}"
        UserMailer.trial_day_3(user).deliver!
      end
    end

    # Fourth educational email
    User.where("trial_began < ? and trial_began > ?", 4.days.ago.at_midnight, 5.days.ago.at_midnight).each do |user|
      unless user.active_subscription?
        puts "sending 'Day 4' email to user #{user.id}"
        UserMailer.trial_day_4(user).deliver!
      end
    end

    # Fifth educational email
    User.where("trial_began < ? and trial_began > ?", 5.days.ago.at_midnight, 6.days.ago.at_midnight).each do |user|
      unless user.active_subscription?
        puts "sending 'Day 5' email to user #{user.id}"
        UserMailer.trial_day_5(user).deliver!
      end
    end

    # Fourth educational email
    User.where("trial_began < ? and trial_began > ?", 6.days.ago.at_midnight, 7.days.ago.at_midnight).each do |user|
      unless user.active_subscription?
        puts "sending 'Day 6' email to user #{user.id}"
        UserMailer.trial_day_6(user).deliver!
      end
    end

  end
end
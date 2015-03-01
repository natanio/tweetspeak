namespace :trials do
  desc "Check for trialing users"
  task :daily => :environment do
    # Check if user should be trialing
    User.where("trial_began < ? and trial_began > ?", 7.days.ago.at_midnight, 8.days.ago.at_midnight).each do |user|
      if user.trialing?
        user.update_attribute(:trialing, false)
        # user.update_attribute(:active_subscription, false)
        user.save
        puts "Changed User #{user.id} from trialing to not trialing"
      end
    end
  end
end
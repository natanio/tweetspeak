namespace :trials do
  desc "Check for trialing users"
  task :daily => :environment do
    # Check if user should be trialing
    User.where("created_at > ?", 8.days.ago.at_midnight).each do |user|
      if user.trialing?
        user.update_attribute(:trialing, false)
        user.save
        puts "Changed User #{user.id} from trialing to not trialing"
      end
    end
  end
end
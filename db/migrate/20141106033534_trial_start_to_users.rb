class TrialStartToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :trial_began, :datetime, :default => nil
  end
end

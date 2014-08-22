class AddBestStreakToUsers < ActiveRecord::Migration
  def change
    add_column :users, :best_streak, :integer, :default => 0
  end
end

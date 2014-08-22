class RemoveBestStreakFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :best_streak, :integer
  end
end

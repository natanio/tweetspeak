class AddLastCalculatedStreakToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_calculated_streak, :integer, :default => 0
  end
end

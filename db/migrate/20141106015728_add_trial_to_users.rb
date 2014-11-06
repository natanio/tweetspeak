class AddTrialToUsers < ActiveRecord::Migration
  def change
    add_column :users, :trialing, :boolean, :default => true
  end
end

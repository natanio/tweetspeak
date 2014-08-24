class AddActiveSubscriptionToUser < ActiveRecord::Migration
  def change
    add_column :users, :active_subscription, :boolean
  end
end

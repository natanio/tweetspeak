class CreateLearningSessions < ActiveRecord::Migration
  def change
    create_table :learning_sessions do |t|
      t.integer :user_id
      t.integer :card_order
    end
  end
end

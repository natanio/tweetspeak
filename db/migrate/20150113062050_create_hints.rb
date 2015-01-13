class CreateHints < ActiveRecord::Migration
  def change
    create_table :hints do |t|
      t.string :title
      t.integer :user_id
      t.integer :card_id
      t.integer :keyphrase_id

      t.timestamps
    end
  end
end

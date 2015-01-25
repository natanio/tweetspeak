class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.string :title
      t.integer :card_id
      t.integer :keyphrase_id

      t.timestamps
    end
  end
end

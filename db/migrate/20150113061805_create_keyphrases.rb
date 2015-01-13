class CreateKeyphrases < ActiveRecord::Migration
  def change
    create_table :keyphrases do |t|
      t.string :title
      t.integer :lesson_id
      t.integer :card_id

      t.timestamps
    end
  end
end

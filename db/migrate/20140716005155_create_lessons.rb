class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :tags
      t.string :text
      t.string :audio

      t.timestamps
    end
  end
end

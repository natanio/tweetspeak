class ChangeDatatypeOnLessonsFromStringToText < ActiveRecord::Migration
  def up
    change_column :lessons, :text, :text, :limit => nil
    change_column :lessons, :pronunciation, :text, :limit => nil
  end

  def down
    change_column :lessons, :text, :string
    change_column :lessons, :pronunciation, :string
  end
end

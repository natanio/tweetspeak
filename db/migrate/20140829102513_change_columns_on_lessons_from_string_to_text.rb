class ChangeColumnsOnLessonsFromStringToText < ActiveRecord::Migration
  def up
    change_column :lessons, :tweet, :text, :limit => nil
    change_column :lessons, :answer, :text, :limit => nil
    change_column :lessons, :audio, :text, :limit => nil
  end

  def down
    change_column :lessons, :tweet, :string
    change_column :lessons, :answer, :string
    change_column :lessons, :audio, :string
  end
end

class RemoveLastLessonFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :last_lesson, :integer
  end
end

class AddLastLessonToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_lesson, :integer
  end
end

class AddLastLessonToUserCourses < ActiveRecord::Migration
  def change
    add_column :user_courses, :last_lesson, :integer
  end
end

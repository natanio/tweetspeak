class AddCourseFinishedToUserCourses < ActiveRecord::Migration
  def change
    add_column :user_courses, :course_finished, :datetime
  end
end

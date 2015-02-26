class AddEndingLessonToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :ending_lesson, :integer
  end
end

class AddStartingLessonToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :starting_lesson, :integer
  end
end

class UserCourse < ActiveRecord::Base
  after_create :set_last_lesson_to_starting

  belongs_to :user
  belongs_to :course

private

  def set_last_lesson_to_starting
    self.update_attribute(:last_lesson, self.course.starting_lesson)
    self.save
  end
end

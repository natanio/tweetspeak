module LessonsHelper
  def is_completed?(lesson)

    user_course = UserCourse.where("user_id = ? AND course_id = ?", current_user.id, lesson.course.id).last
    if user_course.last_lesson == lesson.course.ending_lesson
      'disabled'
    end
  end
end

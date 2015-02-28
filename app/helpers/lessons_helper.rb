module LessonsHelper
  def is_completed?(lesson)
    user_course = UserCourse.where("user_id = ? AND course_id = ?", current_user.id, lesson.course.id).last
    if user_course.last_lesson > lesson.id || user_course.course_finished?
      return true
    #elsif user_course.course_finished?
    end
  end
end

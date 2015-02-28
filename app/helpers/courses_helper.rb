module CoursesHelper
  def is_course_purchase?
    if user_signed_in?
      is_course_or_not = @course.user_courses.where(user_id: current_user.id)
      !is_course_or_not.empty?
    else
      return false
    end
  end
end

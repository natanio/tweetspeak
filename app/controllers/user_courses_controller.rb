class UserCoursesController < ApplicationController

  # POST /user_courses
  def create
    find_course
    @user_course = UserCourse.create(user_id: current_user.id, course_id: @course.id)

    respond_to do |format|
      if @user_course.save
        format.html { redirect_to pages_dashboard_path, notice: 'You have subscribed to this course.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # DELETE /user_courses/1
  def destroy
    @user_course.destroy
    respond_to do |format|
      format.html { redirect_to pages_dashboard_path }
    end
  end

  private

    def find_course
      @course = Course.find(params[:course_id])
    end
end
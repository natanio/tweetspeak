class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy, :step]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_filter :check_user_course, only: [:step]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.order("created_at DESC")
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @lessons = Lesson.find(params[:id])
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.update_attribute :lesson_order_position, :last

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lesson }
      else
        format.html { render action: 'new' }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url }
      format.json { head :no_content }
    end
  end

  def show_video
    render :video, :video => lesson.video
  end

  def step

    if should_see_lesson?

      if params[:step_number]=="1"
        render "step1.html.erb"

      elsif params[:step_number]=="2"
        #check for words
        @words = params[:words].gsub(/[\,\.\?\!\:\;]/,"")
        if @words.empty?
          redirect_to :back, :flash => { :danger => "Please enter an answer, even if it's only one word." }
        else
          @answer = @lesson.answer.gsub(/[\,\.\?\!\:\;]/,"")

          @correct_words = @answer.downcase.split.uniq & @words.downcase.split.uniq
          @wrong_words =   @words.downcase.split.uniq - @answer.downcase.split.uniq
          render "step2.html.erb"
        end

      elsif params[:step_number]=="3"
        @soundcloud_access_token = soundcloud_access_token
        @track = Track.find_by(:user_id => current_user, :lesson_id => @lesson)
        render "step3.html.erb"

      elsif params[:step_number]=="4"
        render "step4.html.erb"

      elsif params[:step_number]=="5"
        set_user_course
        if @user_course.last_lesson == @user_course.course.starting_lesson
          @user_course.update_attribute(:last_lesson, @lesson.id+1)
          current_user.update_attribute(:points, current_user.points + 125)
          redirect_to pages_dashboard_path, notice: "Way to go! Keep it up :)"
          current_user.save
          @user_course.save

        elsif @lesson.id == @user_course.last_lesson
          current_user.update_attribute(:points, current_user.points + 125)
          current_user.save
          @user_course.update_attribute(:last_lesson, @lesson.id+1)
          @user_course.save
          # If they've finished the course, give them a nice message
          if (@user_course.last_lesson - 1) == @user_course.course.ending_lesson
            @user_course.last_lesson = @user_course.course.ending_lesson
            @user_course.save
            redirect_to pages_dashboard_path, notice: "Great job! You've finished this course!"
          else
            redirect_to pages_dashboard_path, notice: "Way to go! Keep it up :)"
          end
        else
          redirect_to pages_dashboard_path
        end
      else
        render "step1.html.erb"
      end
    else
      redirect_to pages_dashboard_path, alert: "Sorry, you can't access that lesson yet."
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.

    def set_lesson
        @lesson = Lesson.find(params[:id])
    end

    def set_user_course
      @user_course = UserCourse.where("user_id = ? AND course_id = ?", current_user.id, params[:course_id]).last
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:title, :tags, :text, :tweet, :audio, :video, :answer, :pronunciation, :lesson_number, :step_number, :course_id)
    end

    def check_user
      if user_signed_in?
      	unless current_user.admin?
        redirect_to pages_dashboard_path, alert: "Sorry, that page is not for students."
        end
      else
      	 redirect_to root_path, alert: "Sorry, you need to sign up or sign in to visit that page."
      end
    end

    def check_user_course
      if user_signed_in?
        user_courses = UserCourse.where("user_id = ? AND course_id = ?", current_user.id, params[:course_id])
        unless user_courses.present?
          course = Course.find(params[:course_id])
          redirect_to course_path(course), alert: "Oops! Looks like you haven't bought this course yet. Check it out!"
        end
      end
    end

    def should_see_lesson?
      current_user.admin? || (((@lesson.id - 1) <= current_user.last_lesson) && is_not_trialing? )
    end

    def is_not_trialing?
      if @lesson.id > 14 && current_user.trialing?
        return false
      else
        return true
      end
    end
end

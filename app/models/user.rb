class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_courses
  has_many :courses, through: :user_courses
  has_many :tracks
  has_many :lessons, through: :tracks

  before_create :set_trial_to_now

  after_create :create_free_course

  def set_trial_to_now
    self.trial_began = Time.now
    # self.active_subscription = true
  end

  def next_lesson(course)
    user_course = UserCourse.where("user_id = ? AND course_id = ?", self.id, course.id)
    user_course.last.last_lesson
  end

  def next_lesson_path(course)
  	"/courses/#{course.id}/lessons/#{next_lesson(course)}/step/1"
  end

  # def set_course
  #   @course = Course.find(params[:id])
  # end

  after_create :send_admin_mail
  def send_admin_mail
    UserMailer.welcome_email(self).deliver
  end

  private

  def is_trialing
    self.trialing?
  end

  def create_free_course
    trial_course = Course.find(1)
    self.user_courses.build(user_id: self.id, course_id: trial_course.id, last_lesson: trial_course.starting_lesson)
  end
end

# This is the old nex_lesson method used with the trial and subscription set up
  # def next_lesson
  #   if is_trialing && last_lesson <= 14
  #    last_lesson+1
  #   elsif !is_trialing
  #     last_lesson+1
  #   else
  #     "alert('Sorry, you've finished all the trial lessons. Please wait until after your trial to continue. Thanks!')"
  #     last_lesson
  #   end
  # end

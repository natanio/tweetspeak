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
  def set_trial_to_now
    self.trial_began = Time.now
    self.active_subscription = true
  end

  def next_lesson
    if is_trialing && last_lesson <= 14
  	 last_lesson+1
    elsif !is_trialing
      last_lesson+1
    else
      "alert('Sorry, you've finished all the trial lessons. Please wait until after your trial to continue. Thanks!')"
      last_lesson
    end
  end

  def next_lesson_path
    # set_course
  	"/lessons/#{next_lesson}/step/1"
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
end

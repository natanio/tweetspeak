class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def next_lesson
  	last_lesson+1
  end

  def next_lesson_path
  	"/lessons/#{next_lesson}/step/1"
  end
end

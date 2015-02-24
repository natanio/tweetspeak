class Course < ActiveRecord::Base
  has_many :lessons
  has_many :user_courses
end

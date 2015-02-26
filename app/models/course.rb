class Course < ActiveRecord::Base
  has_many :lessons
  has_many :user_courses

  has_attached_file :course_image, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "http://longwhiteclouds.com/wp-content/themes/longwhiteclouds/images/missing-image-640x360.png"
  validates_attachment_content_type :course_image, :content_type => /\Aimage\/.*\Z/
end
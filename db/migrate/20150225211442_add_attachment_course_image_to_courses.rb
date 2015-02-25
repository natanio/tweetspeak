class AddAttachmentCourseImageToCourses < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      t.attachment :course_image
    end
  end

  def self.down
    drop_attached_file :courses, :course_image
  end
end

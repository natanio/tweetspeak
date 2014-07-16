class Lesson < ActiveRecord::Base
	has_attached_file :video,
                :url => "#{Rails.root}/app/assets/images/:basename.:extension",
                :path => "#{Rails.root}/app/assets/images/lessons/:id/:style/:basename.:extension"

    validates_attachment_content_type :video, :content_type => ["video/mp4", "video/wmv"]
end

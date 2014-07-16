class Lesson < ActiveRecord::Base
	has_attached_file :video, :styles => {
				:mobile => {:geometry => "400x300", :format => 'mp4', :streaming => true},
    			:medium => { :geometry => "640x480", :format => 'flv' },
    			:medium => { :geometry => "640x480", :format => 'flv', :convert_options => {:output => {:ar => 44100}} },
    			:large => { :geometry => "1024x576", :format => 'flv', :convert_options => {:output => {:ar => 44100}} },
  }, :processors => [:ffmpeg],
                :storage => :dropbox,
      			:dropbox_credentials => Rails.root.join("config/dropbox.yml")
end
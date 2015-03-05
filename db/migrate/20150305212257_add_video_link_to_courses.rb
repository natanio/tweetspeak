class AddVideoLinkToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :video_link, :string
  end
end

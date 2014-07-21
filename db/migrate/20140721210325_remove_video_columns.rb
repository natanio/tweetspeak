class RemoveVideoColumns < ActiveRecord::Migration
  def change
  #remove_column :table_name, :column_name, :type, :options
  remove_column :lessons, :video_file_name, :string
  remove_column :lessons, :video_content_type, :string
  remove_column :lessons, :video_file_size, :integer
  remove_column :lessons, :video_updated_at, :datetime
  end
end

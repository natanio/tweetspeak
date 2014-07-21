class UpdateLessons < ActiveRecord::Migration
  def change
  	add_column :lessons, :answer, :string
  	add_column :lessons, :tweet, :string
  	add_column :lessons, :pronunciation, :string
  end
end

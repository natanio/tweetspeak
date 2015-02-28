class AddPriceAndTagLineToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :price, :integer
    add_column :courses, :tagline, :string
  end
end

class AddLearnedToCards < ActiveRecord::Migration
  def change
    add_column :cards, :learned, :boolean, default: false
  end
end

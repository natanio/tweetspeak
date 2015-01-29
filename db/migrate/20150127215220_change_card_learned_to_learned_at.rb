class ChangeCardLearnedToLearnedAt < ActiveRecord::Migration
  def change
  	change_column :cards, :learned, :datetime
  end
end

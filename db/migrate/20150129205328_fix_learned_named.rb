class FixLearnedNamed < ActiveRecord::Migration
  def change
  	rename_column :cards, :learned, :learned_at
  end
end

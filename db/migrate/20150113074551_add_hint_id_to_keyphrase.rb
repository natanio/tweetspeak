class AddHintIdToKeyphrase < ActiveRecord::Migration
  def change
    add_column :keyphrases, :hint_id, :integer
  end
end

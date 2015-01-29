class RemoveColumnCardFromDefinitions < ActiveRecord::Migration
  def change
  	remove_column :definitions, :card_id
  end
end

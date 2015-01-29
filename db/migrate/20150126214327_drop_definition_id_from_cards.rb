class DropDefinitionIdFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :definition_id
  end
end

class AddCardIdToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :card_id, :integer
  end
end

class AddFieldsToCard < ActiveRecord::Migration
  def change
    add_column :cards, :hint_id, :integer
    add_column :cards, :definition_id, :integer
    add_column :cards, :keyphrase_id, :integer
  end
end

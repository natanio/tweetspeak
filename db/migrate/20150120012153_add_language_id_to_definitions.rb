class AddLanguageIdToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :language_id, :integer
  end
end

class AddEnglishToLanguages < ActiveRecord::Migration
  def change
  	add_column :languages, :english_name, :string
  end
end

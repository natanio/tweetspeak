class AddCardsDefinitionsTable < ActiveRecord::Migration
  def change
  	create_table :card_definitions, id: false do |t|
      t.belongs_to :card, index: true
      t.belongs_to :definition, index: true
    end
  end
end

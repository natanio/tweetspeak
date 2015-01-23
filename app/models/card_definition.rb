class CardDefinition < ActiveRecord::Base
  belongs_to :card
  belongs_to :definition
end
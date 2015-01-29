class Card < ActiveRecord::Base
  has_one :keyphrase
  has_one :hint, through: :keyphrase, source: :hints

  has_many :card_definitions
  has_many :definitions, through: :card_definitions
  
  belongs_to :lesson
  belongs_to :user

  scope :unlearned, -> {
  	where( unlearned_at.present? )
  }
end

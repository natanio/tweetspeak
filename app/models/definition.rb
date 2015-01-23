class Definition < ActiveRecord::Base

  has_many :card_definitions
  has_many :cards, :through => :card_definitions
  belongs_to :keyphrase

end

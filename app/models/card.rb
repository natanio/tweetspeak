class Card < ActiveRecord::Base
  has_one :keyphrase
  has_one :hint, through: :keyphrase, source: :hints

  has_many :definitions, through: :keyphrase
  
  belongs_to :lesson
  belongs_to :user
end

class Keyphrase < ActiveRecord::Base
  has_many :definitions
  has_many :hints

  belongs_to :lesson
  belongs_to :card

end

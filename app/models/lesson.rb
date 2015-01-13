class Lesson < ActiveRecord::Base
	has_many :tracks
	has_many :users, through: :tracks
  has_many :cards
  has_many :keyphrases, through: :cards
  has_many :definitions, through: :cards
  has_many :hints, through: :cards
	
	include RankedModel
	ranks :lesson_order

end
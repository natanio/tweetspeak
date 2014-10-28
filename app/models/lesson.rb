class Lesson < ActiveRecord::Base
	has_many :tracks
	has_many :users, through: :tracks
	
	include RankedModel
	ranks :lesson_order

end
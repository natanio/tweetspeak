class Lesson < ActiveRecord::Base
	has_many :tracks
	has_many :users, through: :tracks

  belongs_to :course

	include RankedModel
	ranks :lesson_order

end
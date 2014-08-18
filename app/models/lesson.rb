class Lesson < ActiveRecord::Base
	include RankedModel
	ranks :lesson_order
end
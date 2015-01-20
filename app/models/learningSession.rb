class LearningSession < ActiveRecord::Base
	include RankedModel
	ranks :card_order
	
end
class Learning_session < ActiveRecord::Base
	include RankedModel
	ranks :card_order

end
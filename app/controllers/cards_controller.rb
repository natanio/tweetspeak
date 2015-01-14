class CardsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :set_cards

	private
	def set_cards
		@cards = Card.where(user_id: current_user.id)
	end

end
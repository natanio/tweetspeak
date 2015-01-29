class CardsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@cards = find_learning_session.cards.unlearned
	end

private
	
	def find_learning_session
		current_user.learning_sessions.find(params[:learning_session_id])
	end
end
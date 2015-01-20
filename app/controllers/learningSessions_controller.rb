class LearningSessionsController < ApplicationController
	before_filter :authenticate_user!

	def index
		
	end

	def show
		@cards = Card.where(user_id: current_user.id).
				 where(learned: false)
		#@definition = 
	end

	private
	

end
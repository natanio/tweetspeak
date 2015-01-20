class LearningSessionsController < ApplicationController
	before_filter :authenticate_user!

	def index
		
	end

	def show
		@cards = Card.where(user_id: current_user.id).
				 where(learned: false)
		#@definition = 
	end

	def new
	end

	def create
		@learningSession = Learning_session.new(:user_id => params[:user_id])

		respond_to do |format|
		  if @learningSession.save
		    format.html { redirect_to @learningSession }
		    format.json { render action: 'show', status: :created, location: @learningSession }
		  else
		    format.html { render action: 'new' }
		    format.json { render json: @learningSession.errors, status: :unprocessable_entity }
		  end
		end
	end

	private
	

end
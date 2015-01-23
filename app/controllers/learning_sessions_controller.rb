class LearningSessionsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :set_session, only: [:show, :index]

	def index
		
	end

	def show
		cards = Card.where(user_id: current_user.id).
				 where(learned: false).order(created_at: :asc)
        @cards = cards.paginate(page: params[:page], per_page: 1)
        @language = Language.find_by_id(current_user.language_id)
	end

	def new
	end

	def create
		@learning_session = Learning_Session.new(:user_id => params[:user_id])

		respond_to do |format|
		  if @learning_session.save
		    format.html { redirect_to @learning_session }
		    format.json { render action: 'show', status: :created, location: @learningSession }
		  else
		    format.html { render action: 'new' }
		    format.json { render json: @learningsession.errors, status: :unprocessable_entity }
		  end
		end
	end

	def update
		respond_to do |format|
		  if @learning_session.save
		    format.html { redirect_to @learning_session }
		    format.json { render action: 'show', status: :created, location: @learningSession }
		  else
		    format.html { render action: 'new' }
		    format.json { render json: @learningsession.errors, status: :unprocessable_entity }
		  end
		end
	end

	private
	def set_session
		@learning_session = Learning_Session.find(params[:id])
	end

end
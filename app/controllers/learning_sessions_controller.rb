class LearningSessionsController < ApplicationController
	before_filter :authenticate_user!

	def index
	end

	def show
		find_learning_session
	end

	def new
		new_learning_session
	end

	def create
		new_learning_session(learning_session_params)

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
		find_learning_session
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

	def find_learning_session
		@learning_session = current_user.learning_sessions.find(params[:id])
	end

	def new_learning_session(attributes={})
		@learning_session = current_user.learning_sessions.build(attributes)
	end

end
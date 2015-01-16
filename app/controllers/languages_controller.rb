class LanguagesController < ApplicationController
	def show
	end

	def new
		@language = Language.new
	end

	def create
		@language = Language.new(language_params)

		@user= current_user
		@user.update_attribute(:language_id, @language.id)
		@user.save

		respond_to do |format|
	      if @language.save
	        format.html { redirect_to :back, notice: @language.name + " was successfully created." }
	        format.json { render action: 'show', status: :created, location: @language }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @language.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private
	def language_params
      params.require(:language).permit(:name)
    end
end
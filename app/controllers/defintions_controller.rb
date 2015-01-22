class DefinitionsController < ApplicationController
	def show
	end

	def new
		@defintion = Definition.new
	end

	def create
		@defintion = Definition.new(definition_params)

		respond_to do |format|
	      if @defintion.save
	        format.html { redirect_to :back, notice: "Your defintion was successfully created." }
	        format.json { render action: 'show', status: :created, location: @language }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @defintion.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private
	def definition_params
      params.require(:defintion).permit(:title, :card_id, :keyphrase_id, :language_id)
    end
end
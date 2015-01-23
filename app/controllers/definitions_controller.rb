class DefinitionsController < ApplicationController
	before_filter :authenticate_user!

	def show
	end

	def new
		@definition = Definition.new
	end

	def create
		@definition = Definition.new(definition_params)

		respond_to do |format|
	      if @definition.save
	        format.html { redirect_to :back, notice: "Your defintion was successfully created." }
	        format.json { render action: 'show', status: :created, location: @language }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @definition.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def update
    respond_to do |format|
      if @definition.update(definition_params)
        format.html { redirect_to :back, notice: 'Definition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @definition.errors, status: :unprocessable_entity }
      end
    end
  end

	private
	def definition_params
      params.require(:definition).permit(:title, :card_id, :keyphrase_id, :language_id)
    end
end
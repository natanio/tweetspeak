class TracksController < ApplicationController
	# GET /tracks/new
  def new
    @track = Track.new
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = current_user.tracks.create lesson_id: params[:lesson_id]

    respond_to do |format|
      if @track.save
        format.html { redirect_to @lesson, notice: 'Your audio was successful.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url }
      format.json { head :no_content }
    end
  end
end
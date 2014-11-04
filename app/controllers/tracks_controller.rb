class TracksController < ApplicationController
  before_action :set_lesson
  before_filter :authenticate_user!

  # POST /lessons/1/tracks
  def create
    @track = Track.new track_params
    @track.user = current_user
    @track.lesson = @lesson
 
    if @track.save
      render json: @track, status: :created
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:track_url)
    end

    def set_lesson
      @lesson = Lesson.find params[:lesson_id]
    end
end
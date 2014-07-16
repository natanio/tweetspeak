class StaticPagesController < ApplicationController
  def home
  	render :layout => "home"
  end
end

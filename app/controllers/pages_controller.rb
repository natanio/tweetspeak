class PagesController < ApplicationController
	before_filter :authenticate_user!, only: [:dashboard]
	
  def about
  	render :layout => "home"
  end

  def contact
  end

  def dashboard
  end
    
end

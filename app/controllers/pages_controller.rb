class PagesController < ApplicationController
	before_filter :authenticate_user!, only: [:dashboard]
	
  def about
  end

  def contact
  end

  def dashboard
  end
    
end

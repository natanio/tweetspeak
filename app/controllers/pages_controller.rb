class PagesController < ApplicationController
	before_filter :authenticate_user!, only: [:dashboard]
	before_filter :check_subscription, only: [:dashboard]
	
  def about
  	render :layout => "home"
  end

  def contact
  end

  def dashboard
  end

  def check_subscription
      if user_signed_in? && !current_user.active_subscription == true
        redirect_to new_charge_path, alert: "Before you can access your dashboard, you need to choose a plan. Thanks!"
      end
    end
    
end

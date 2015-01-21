class UsersController < ApplicationController
	before_filter :check_user, only: [:index]
	
  def index
    @users = User.all
  end

  private

  def check_user
      if user_signed_in?
      	unless current_user.admin? 
        redirect_to pages_dashboard_path, alert: "Sorry, that page is not for students."
        end
      else
      	 redirect_to root_path, alert: "Sorry, you need to sign up or sign in to visit that page."
      end
    end
end
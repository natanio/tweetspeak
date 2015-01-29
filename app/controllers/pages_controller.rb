class PagesController < ApplicationController
	before_filter :authenticate_user!, except: [:about, :contact]
	before_filter :check_subscription, except: [:about, :contact]
  before_filter :check_trialing, only: [:subscription]
  before_filter :best_streak, only: [:dashboard]

  helper PagesHelper
	
  def about
  	render :layout => "home"
  end

  def contact
  end

  def dashboard
    time_to_learn
  end

  def dictionary
  end

  def subscription
  end

private

  def check_subscription
      if user_signed_in? && !current_user.active_subscription == true
        redirect_to new_charge_path, alert: "Before you can access your dashboard, you need to choose a plan. Thanks!"
      end
  end

  def best_streak
    @streak = current_user.best_streak
    unless @streak > 0
      current_user.update_attribute(:best_streak, 1)
      current_user.save
    end
  end

  def check_trialing
    if current_user.trialing
      redirect_to new_charge_path, alert: "Ready to get started? Choose a plan below."
    end
  end

  def time_to_learn
    @cards = Card.where(user_id: current_user.id, learned_at: nil)

    if @cards.length >= 5
      return true
    else
      return false
    end
  end
  helper_method :time_to_learn
    
end

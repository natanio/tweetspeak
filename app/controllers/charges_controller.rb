class ChargesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  before_filter :only_inactive_customers, only: [:new, :create]

	def new
	end

	def create

	  Stripe.api_key = ENV["STRIPE_API_KEY"]

	  customer = Stripe::Customer.create(
	    :description => current_user.email,
	    :plan  => params[:charges][:plan_type],
	    :card  => params[:stripeToken],
	    :customer => params[:customer]
	  )
	  
	  if !customer.default_card.nil?
		  flash[:notice] = "Charge went well"
		  current_user.active_subscription = true
		  current_user.update_attribute(:customer_id, customer.id)
		  current_user.save
		  redirect_to pages_dashboard_path
		end

	  rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to charges_path

	end

	def only_inactive_customers
		if current_user
			if current_user.active_subscription
				redirect_to pages_dashboard_path
			end
		end
		return true
	end
end

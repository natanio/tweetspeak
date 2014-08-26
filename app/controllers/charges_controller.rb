class ChargesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :cancel]
  before_filter :only_inactive_customers, only: [:new, :create, :cancel]

	def new
	end

	def create

	  Stripe.api_key = ENV["STRIPE_API_KEY"]

		# Get the credit card details submitted by the form
		token = params[:stripeToken]

		customer = Stripe::Customer.create(
  			:card => params[:stripeToken],
  			:description => current_user.email
  		)

  		if params[:plan_type] == "ts_monthly"

			Stripe::Customer.create(
  				:card => token,
  				:plan => params[:plan_type],
  				:email => current_user.email
			)

  		elsif params[:plan_type] == "ts_yearly"

			Stripe::Customer.create(
  				:card => token,
  				:plan => params[:plan_type],
  				:email => current_user.email
			)
  		elsif params[:plan_type] == nil

	  		Stripe::Charge.create(
			    :amount => 97*100, # incents 
			    :currency => "usd",
			    :customer => customer
			)
		else
			# Add a message to choose a plan
	  	end 
	  
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

	def update
	end

	def cancel
		flash[:notice] = "Hate to see you go!"
		@customer = Stripe::Customer.retrieve(current_user.customer_id) 
		@customer.subscriptions.first.delete() 
		current_user.active_subscription = false
		current_user.save
		redirect_to root_path
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

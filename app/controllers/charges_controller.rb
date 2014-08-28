class ChargesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :cancel]
  before_filter :only_inactive_customers, only: [:new, :create ]

	def new
		render :layout => "home"
	end

	def create

	  Stripe.api_key = ENV["STRIPE_API_KEY"]

		# Get the credit card details submitted by the form
		token = params[:stripeToken]
		plan = params[:charges][:plan_id]

  		if plan == "ts_monthly"

			customer = Stripe::Customer.create(
  				:card => token,
  				:plan => plan,
  				:email => current_user.email
			)

  		elsif plan == "ts_yearly"

			customer = Stripe::Customer.create(
  				:card => token,
  				:plan => plan,
  				:email => current_user.email
			)

  		elsif plan == "lifetime"

  			customer = Stripe::Customer.create(
  				:card => token,
  				:description => current_user.email
)
	  		Stripe::Charge.create(
			    :amount => 97*100, # incents 
			    :currency => "usd",
			    :customer => customer
			)
		else
			flash[:alert] = "There was an error. Please check to make sure JavaScript is running in your browser settings."
			redirect_to new_charge_path
	  	end 
	  
	  if !customer.default_card.nil?
		  flash[:notice] = "Thanks and welcome! Your payment was successful."
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
		Stripe.api_key = ENV["STRIPE_API_KEY"]
		
		flash[:notice] = "Hate to see you go! Hope to see you again soon!"
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

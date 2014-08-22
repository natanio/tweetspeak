class ChargesController < ApplicationController

	def new
	end

	def create
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
	    :card  => params[:stripeToken]
	  )

	  #monthly_plan = Stripe::Plan.create(
  		#:amount => 500,
  		#:interval => 'month',
  		#:name => 'Monthly Subscription',
  		#:statement_description: => 'TweetSpeak'
  		#:currency => 'usd',
  		#:id => 'monthly'
  		#:trial_period => '7'
	  #)

	  charge = Stripe::Charge.create(
    	:customer    => customer.id,
    	:amount      => @amount,
    	:description => 'Tweet Speak customer',
    	:currency    => 'usd'
  )

	  rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

end

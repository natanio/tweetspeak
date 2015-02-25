class UserCoursesController < ApplicationController

  # POST /user_courses
  def create
    find_course

    Stripe.api_key = ENV["STRIPE_API_KEY"]

    # Get the credit card details submitted by the form
    token = params[:stripeToken]
    plan = params[:charges][:plan_id]

    if plan == "course_purchase"

      customer = Stripe::Customer.create(
          :card => token,
          :description => current_user.email
        )
        Stripe::Charge.create(
          :amount => 15*100,
          :currency => "usd",
          :customer => customer
        )
    else
      flash[:alert] = "There was an error. Please check to make sure JavaScript is running in your browser settings."
      redirect_to new_charge_path
    end

    if !customer.default_card.nil?
      flash[:notice] = "Thanks for your purchase! Your payment was successful."
      @user_course = UserCourse.create(user_id: current_user.id, course_id: @course.id)
      current_user.update_attribute(:customer_id, customer.id)
      current_user.save
      redirect_to pages_dashboard_path
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end

  # DELETE /user_courses/1
  def destroy
    @user_course.destroy
    respond_to do |format|
      format.html { redirect_to pages_dashboard_path }
    end
  end

  private

    def find_course
      @course = Course.find(params[:course_id])
    end
end
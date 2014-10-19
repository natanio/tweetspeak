class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def next_lesson
    if trialing && last_lesson <= 14
  	 last_lesson+1
    elsif !trialing
      last_lesson+1
    else
      "alert('Sorry, you've finished all the trial lessons. Please wait until after your trial to continue. Thanks!')"
      last_lesson
    end
  end

  def next_lesson_path
  	"/lessons/#{next_lesson}/step/1"
  end

  after_create :send_admin_mail
  def send_admin_mail
    UserMailer.welcome_email(self).deliver
  end

  private
  def trialing
    Stripe.api_key = ENV["STRIPE_API_KEY"]
    
    @customer = Stripe::Customer.retrieve(customer_id)

    if @customer.status = "trialing"
      return true
    else
      return false
    end
  end
  
end

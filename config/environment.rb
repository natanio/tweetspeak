# Load the Rails application.
require File.expand_path('../application', __FILE__)

APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")

# Initialize the Rails application.
Tweetspeak::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def soundcloud_access_token
      session[:soundcloud] ||= soundcloud.access_token
    end

    def soundcloud
      @soundcloud = Soundcloud.new(:client_id => ENV["CLIENT_ID"],
                                    :client_secret => ENV["CLIENT_SECRET"],
                                    :username => ENV["SC_USERNAME"],
                                    :password => ENV["SC_PASSWORD"])
      @soundcloud.exchange_token
      @soundcloud
    end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_in) << :email
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def after_sign_in_path_for(resource)
    "/dashboard"
  end
end

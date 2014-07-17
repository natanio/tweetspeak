module ApplicationHelper
	# this method will embed the code from the partial
  def show_video(url)
    render :partial => 'shared/video', :locals => { :url => url }
  end 

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end

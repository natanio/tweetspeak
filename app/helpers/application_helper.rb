module ApplicationHelper
	# this method will embed the code from the partial
  def show_video(url)
    render :partial => 'shared/video', :locals => { :url => url }
  end 
end

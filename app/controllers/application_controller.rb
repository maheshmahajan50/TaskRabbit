class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  

  def authorize
    redirect_to sessions_path unless current_user
  end

end

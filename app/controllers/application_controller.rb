class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  

  def authorize
    redirect_to sessions_path unless logged_in?
  end

  def logged_in?
    !current_user.nil?
  end

end

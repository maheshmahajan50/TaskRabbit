class SessionsController < ApplicationController
  skip_before_action :authorize, only: %i[new create]
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate?(params[:password_digest])
      session[:user_id] = user.id
      redirect_to tasks_path
    else
      flash[:alert] = "Oops! Credentials not correct"
      redirect_to new_sessions_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to new_sessions_path
  end


end

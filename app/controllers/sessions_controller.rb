class SessionsController < ApplicationController
  skip_before_action :authorize, only: %i[new create]
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate?(params[:password_digest])
      flash[:success] = "Hi!! #{user.name}, you're successfully logged in."
      session[:user_id] = user.id
      redirect_to tasks_path
    else
      flash[:danger] = "Oops! Credentials not correct"
      redirect_to new_sessions_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to new_sessions_path
  end

  def show
    @current_user ||= User.find(session[:user])
  end

  def edit
    @current_user ||= User.find(session[:user])
  end

  def update
    if @current_user.update_attributes(params.require(:current_user).permit(:name,
                                       :email, :role, :phone, :address, :profile_image))
      flash[:success] = "Your details have been successfully updated..."
      redirect_to sessions_path
    else
      render 'edit'
    end
  end  


end

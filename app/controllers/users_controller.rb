 class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create show ]

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   @user.email.downcase!
  #   if @user.save
  #     @user.password!(user_password[:password_digest])
  #     flash[:success] = "Hey! #{@user.name} :Your account created successfully! Now you can login"
  #     session[:user_id] = @user.id
  #     redirect_to new_sessions_path
  #   else
  #     render :new
  #   end
  # end
  
  
  def show
    @task = Task.find(params[:id])
  end

  private

  def user_params
   params.require(:user).permit(:name, :email, :role,
    :phone, :address, :profile_image)
  end

  def user_password
    params.require(:user).permit(:password_digest)
  end
end
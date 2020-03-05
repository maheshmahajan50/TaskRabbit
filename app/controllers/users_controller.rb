# This class is for controlling the actions of user.
# class UsersController
class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show contact_show]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def show
    @user = User.find(params[:id])
    @user_tasks = @user.tasks.paginate(page: params[:page], per_page: 5)
  end  

  def contact_show
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

# This class is for controlling the actions of user.
# class UsersController
class UsersController < ApplicationController
  before_action :require_same_user, only: %i[edit update destroy]
  before_action :require_admin, only: %i[destroy]

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

  def make_admin
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    flash[:success] = "#{@user.name} is also an admin now"    
    redirect_to users_path
  end

  def remove_admin
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    flash[:danger] = "#{@user.name} was not an admin now"     
    redirect_to users_path
  end  
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all tasks created by user have been deleted"  
    redirect_to users_path
  end  

  private

  def user_params
    params.require(:user).permit(:name, :email, :role,
                                 :phone, :address, :profile_image)
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to tasks_path 
    end   
  end

  def require_admin
    if user_signed_in? and !current_user.admin?
      flash[:danger] = "Only admins can perform that action"
      redirect_to tasks_path
    end     
  end  
end

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to tasks_path
    else
      redirect_to signup_path
    end
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :role, :phone, :address)
  end 

  # before_action :set_user, only: [:show, :edit, :update, :destroy]


  # def index
  #   @users = User.all
  # end

  # def show
  # end

 
  # def new
  #   @user = User.new
  # end

  
  # def edit
  # end

 
  # def create
  #    @user = user.new(user_params)
      
  #     respond_to do |format|
  #        if @user.save
  #           format.html { redirect_to @user, notice: 'User was successfully created.' }
  #           format.json { render :show, status: :created, location: @recipe }
  #        else
  #           format.html { render :new }
  #           format.json { render json: @user.errors, status: :unprocessable_entity }
  #        end
  #     end
  # end

  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

 
  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
    
  #   def set_user
  #     @user = User.find(params[:id])
  #   end

  #   def user_params
  #     params.require(:user).permit(:email, :name, :role, :address, :contact_no)
  #   end
end

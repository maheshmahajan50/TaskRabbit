# This class is for controlling the sessions controller.
# class SessionsController
class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show edit update]

  def show
    @current_user_tasks = current_user.tasks.paginate(page: params[:page], per_page: 5)
  end

  def edit
    @current_user
  end

  def update
    if current_user.update_attributes(allowed_params)
      flash[:success] = 'Your details have been successfully updated...'
      redirect_to sessions_path
    else
      render 'edit'
    end
  end

  private

  def allowed_params
    params.require(:current_user).permit(:name, :email, :role,
                                         :phone, :address, :profile_image)
  end
end

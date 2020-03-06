# This class is for controlling the Tasks actions
# class TasksController
class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]
  before_action :require_same_user, only: %i[edit update destroy]
  def index
    if params[:category].blank?
      @tasks = Task.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:category]).id
      @tasks = Task.paginate(page: params[:page], per_page: 5).where(category_id: @category_id).order('created_at DESC')
    end
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
    if @task.user.main_admin?
      flash[:info] = "Oops!! You can't edit main admin's task"
      redirect_to task_path
    end  
  end

  def create
    @task = current_user.tasks.build(allowed_params)
    
    if @task.save
      flash[:success] = 'You have created your task successfully'
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def update
    if @task.update_attributes(allowed_params)
      flash[:success] = 'Your task has been updated successfully'
      redirect_to task_path
    else
      render 'edit'
    end
  end

  def show
    @task = Task.find(params[:id])
    @user_tasks = @task.user.tasks.paginate(page: params[:page],
                                            per_page: 5)
  end

  def destroy
    unless @task.user.main_admin?
      @task.destroy
      flash[:danger] = 'Article was successfully deleted'
      redirect_to tasks_path
    else
      flash[:info] = "Oops!!! You can't delete main admin's post"
      redirect_to task_path
    end          
  end

  private

  def allowed_params
    params.require(:task).permit(:title, :description,
                                 :company_name, :location,
                                 :estimated_date, :category_id,
                                 :user_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def require_same_user
    if current_user != @task.user and !current_user.admin?
      flash[:danger] = "You can only edit and delete your own task"
      redirect_to tasks_path
    end  
  end  
end

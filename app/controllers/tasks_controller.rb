class TasksController < ApplicationController
  before_action :find_task,    only: [:edit, :update, :destroy]

  def index
    if params[:category].blank?
      @tasks = Task.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @tasks = Task.all.where(category_id: @category_id).order("created_at DESC")
    end      
  end

  def new
    @task = current_user.tasks.build
    @categories = Category.all.map{ |cat| [cat.name, cat.id] }
  end
    
  def edit
    @categories = Category.all.map{ |cat| [cat.name, cat.id] }
  end  
  
  def create
    @task = current_user.tasks.build(allowed_params)
    @task.user = current_user
    @task.category_id = params[:category_id]
    if @task.save!
      flash[:success] = "You have created your task successfully"
      redirect_to tasks_path
    else
      render 'new'
    end    
  end

  def update
    @categories = Category.all.map{ |cat| [cat.name, cat.id] }

    if @task.update_attributes!(allowed_params)
      redirect_to task_path, :notice => 'Your post has been updated.'
    else
      render 'edit'
    end    
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def allowed_params
    params.require(:task).permit(:title, :description, :company_name, :location, :estimated_date, :category_id, :user_id)
  end 

  def find_task
    @task = current_user.tasks.find(params[:id])
  end  

end

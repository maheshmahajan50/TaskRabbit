class TasksController < ApplicationController
	def index
    if params[:category].blank?
      @tasks = Task.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @tasks = Task.where(category_id: @category_id).order("created_at DESC")
    end      
  end

  def new
    @task = Task.new
    @categories = Category.all.map{ |cat| [cat.name, cat.id] }
  end
    
  def edit
    @task = Task.find(params[:id])
    @categories = Category.all.map{ |cat| [cat.name, cat.id] }

  end  
  
  def create
    @task = Task.new(allowed_params)
    @task.category_id = params[:category_id]
    if @task.save!
      redirect_to tasks_path
    else
      render 'new'
    end    
  end

  def update
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def allowed_params
    params.require(:task).permit(:title, :description, :company_name, :location, :estimated_date, :category_id)
  end  

end

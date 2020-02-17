class CategoriesController < ApplicationController
	def index
    @categories = Category.all
    @categories.order("created_at DESC")
  end 

  def new
    @category = Category.new
  end 

  def edit
    @category = Category.find(params[:id])
  end 
  
  def show
    @category = Category.find(params[:id])
  end  
  def create
    @category = Category.new(allowed_params)
    if @category.save!
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes!(allowed_params)
      redirect_to category_path
    else
      render 'edit'
    end    
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def allowed_params
    params.require(:category).permit!
  end  
end

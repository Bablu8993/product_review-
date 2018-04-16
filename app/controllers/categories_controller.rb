class CategoriesController < ApplicationController
  def index
    @categories = Category.all.page(params[:page]).per(10).order('created_at desc') 
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.valid?
      @category.save
      redirect_to new_category_path
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end

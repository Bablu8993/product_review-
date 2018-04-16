class ProductsController < ApplicationController
  include ApplicationHelper

  def index
    @products = Product.all.page(params[:page]).per(10).order('user_count DESC').reorder('hitcount DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    if params[:id] != 'all_products'
      @product = Product.find(params[:id])
      count = @product.hitcount + 1
      @product.update_attributes(:hitcount => count)
      update_usercount(current_user.email, @product.product_name, @product)
    end
    # redirect_to products_path  
  end

  def all_products
    @products = Product.where(category_id: params[:category][:id]).page(params[:page]).per(10).order('user_count DESC').order('hitcount DESC')
    render 'index'
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :category_id, :price, :release_date)
  end
end

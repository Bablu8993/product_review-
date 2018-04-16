class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]
  def index
    redirect_to new_user_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid? 
      @user.save
      session[:user_id] = @user.id
      redirect_to products_path
      flash[:success] = "Thank you for signing up!"
    else
      render "new"
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
end

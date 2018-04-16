class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :destroy]

  def new
  end

  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, Your has successfully logged in"
      redirect_to products_path
    else
      flash[:success] = "Email or password is invalid."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end

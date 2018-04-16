class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize

  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  protected 
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to new_user_path, notice: "Please Sing Up or Login"
    end
  end 

  helper_method :current_user
end

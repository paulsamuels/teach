class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    if current_user
      true
    else
      redirect_to log_in_path
    end
  end
end

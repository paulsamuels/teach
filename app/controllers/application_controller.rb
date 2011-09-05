class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :logged_in?
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    if current_user
      true
    end
  end
  
  def has_access?
    if logged_in?
      true
    else
      redirect_to log_in_url
    end
  end
end

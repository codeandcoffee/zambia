class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  private
  
  def current_user
    @current_user ||= User.find(:first, :conditions => { :id => session[:user_id]}) if session[:user_id]
    
    raise @current_user.to_yaml if @current_user
  end
end

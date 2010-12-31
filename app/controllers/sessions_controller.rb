class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_by(:conditions => { :uid => auth["uid"], :provider => auth["provider"] })
    
    session[:user_id] = user.id
    
    #raise auth.to_yaml
    
    redirect_to root_url, :notice => "Signed in"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out"
  end
end

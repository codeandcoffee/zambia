class UsersController < ApplicationController
  
  authorize_resource
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to root_url, :notice => "Registered!"
    else
      render "new"
    end
  end

end

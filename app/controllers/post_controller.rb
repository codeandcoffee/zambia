class PostController < ApplicationController
  
  authorize_resource

  def new
  end
  
  def index
  end
  
  def show
    @post = Post.find(:first, :conditions => { :slug => params[:slug] })
   
    if !@post
      render "index"
    end
  end
  
  def list
    @posts = Post.all
    render :partial => "list", :layout => false
  end
end

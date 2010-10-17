class PostController < ApplicationController
  def index
  end
  
  def show
    @post = Post.find(:first, :conditions => { :slug => params[:slug] })
   
    #if !@post
    #  render "404"
    #end
    
  end
  
end

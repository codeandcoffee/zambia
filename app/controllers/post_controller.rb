class PostController < ApplicationController
  def index
  end
  
  def show
    
    @post = Post.find(:first, :conditions => { :slug => :slug })
   
    #if !@post
    #  render "404"
    #end
   
    if @post == nil
      @post = Post.new(:title => "I AM THE TITLE", :body => "I AM THE BODY")
    end
    
  end
  
end

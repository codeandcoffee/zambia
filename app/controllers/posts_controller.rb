class PostsController < ApplicationController
  
  authorize_resource
  
  # GET /posts
  def index
    @posts = Post.all.asc(:name)
  end
  
  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
  end
  
  def list
    @posts = Post.all
    render :partial => "list", :layout => false
  end

  # GET /posts/new
  def new
    @post = Post.new
  end
  
  # POST /posts
  def create
    @post = Post.new(params[:post])
    @post.author = current_user.email
    
    @post.slug = @post.to_slug
  
    if (@post.save)
      redirect_to posts_path
    else
      render :new
    end
  end
  
  # GET /posts/:id/edit
  def edit
    @post = Post.find(params[:id])
  end

  # PUT /posts/:id
  def update
    @post = Post.find(params[:id])
    if (@post.update_attributes(params[:post]))
      redirect_to posts_path
    else
      render :edit
    end
  end

  # DELETE /posts/:id
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
end

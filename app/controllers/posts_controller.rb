class PostsController < ApplicationController
  respond_to :js

  def user_posts
  @posts = current_user.posts.paginate(:page => params[:page], :per_page => 10)
  end
  def index
  @posts = Post.all_publish.paginate(:page => params[:page], :per_page => 10)

  end
  
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
    redirect_to @post
    else
     render 'new'
    end
  end
  
  def new
    @post = Post.new
    @post.images.build
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end 
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :subject, :description, :publish, :images_attributes => [:image_name, :imageable_id ,:imageable_type])
  end

end

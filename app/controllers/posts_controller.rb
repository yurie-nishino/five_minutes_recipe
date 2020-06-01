class PostsController < ApplicationController
  
  before_acti

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @posts = @posts.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    
  end  

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end
  
private
  def post_params
    params.require(:post).permit(:name, :image, :text, :user_id).merge(user_id: current_user.id)
  end
end

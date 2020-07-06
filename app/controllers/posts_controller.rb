class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update,:destroy]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @posts = @posts.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
    logger.debug("JS_test")
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
    
  end  

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end
  


private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:name, :image, :text, :user_id).merge(user_id: current_user.id)
  end

end

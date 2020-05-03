class MypagesController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id ).page(params[:page]).per(5).order("created_at DESC")
  end


  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end



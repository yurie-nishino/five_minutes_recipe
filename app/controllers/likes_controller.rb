class LikesController < ApplicationController
  before_action :set_post

  def create
    :javascript
  console.log('js_create3');
    @like = Like.create(user_id: @current_user.id, post_id: params[:post_id])#投稿ユーザーと内容
    @likes = Like.where(post_id: params[:post_id])#いいねの合計数
    @post.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    like.destroy
    @likes = Like.where(post_id: params[:post_id])#いいねの合計数
    @post.reload
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

end

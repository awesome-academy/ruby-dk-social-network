class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    @post.likes.create user_id: current_user.id
    respond_to do |format|
      format.html{redirect_to root_path}
      format.js
    end
  end

  def destroy
    @like.destroy
    respond_to do |format|
      format.html{redirect_to root_path}
      format.js
    end
  end

  private

  def find_post
    @post = Post.find_by id: params[:post_id]
  end

  def find_like
    @like = @post.likes.find_by id: params[:id]
  end
end

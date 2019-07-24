class CommentsController < ApplicationController
  before_action :load_post
  before_action :logged_in_user, only: %i(create destroy)
  before_action :correct_comment, only: :destroy

  def create
    @comment = @post.comments.build comment_params
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html{redirect_to root_path}
        format.js
      end
    else
      flash.alert = t "comment_fail"
      render root_path
    end
  end

  def destroy
    if @comment.destroy?
      respond_to do |format|
        format.html{redirect_to request.referrer || root_url}
        format.js
      end
    else
      flash.alert = t "del_fail"
      render "home/index"
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end

  def load_post
    @post = Post.find_by id: params[:post_id]
    return if @post
    flash.alert = t "post_not_found"
    redirect_to root_url
  end

  def correct_comment
    @comment = current_user.comments.find_by id: params[:id]
    return if @comment
    flash.alert = t "comment_not_found"
    redirect_to root_url
  end
end

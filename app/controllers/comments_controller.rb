class CommentsController < ApplicationController
  before_action :load_post
  before_action :logged_in_user, only: %i(create destroy)
  before_action :correct_comment, only: :destroy

  def create
    @comment = @post.comments.build comment_params
    @comment.user_id = current_user.id

    return unless @comment.save
    respond_to do |format|
      format.html{redirect_to root_path}
      format.js
    end
  end

  def destroy
    if @comment.destroy
      flash.notice = t "del_comment"
    else
      flash.alert = t "del_fail"
    end
    redirect_to request.referrer || root_url
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end

  def load_post
    @post = Post.find_by id: params[:post_id]
    redirect_to root_url unless @post
  end

  def correct_comment
    @comment = current_user.comments.find_by id: params[:post_id]
    redirect_to root_url unless @comment
  end
end

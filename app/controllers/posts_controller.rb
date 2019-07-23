class PostsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :correct_user, only: :destroy

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash.notice = t "create_success"
      redirect_to root_path
    else
      @feed_items = []
      render "home/index"
    end
  end

  def destroy
    @post.destroy

    if @post.destroyed?
      flash[:success] = t "del_post"
    else
      flash[:danger] = t "del_fail"
    end
    redirect_to request.referrer || root_url
  end

  private

  def post_params
    params.require(:post).permit :content, :status,
      photos_attributes: [:image],
      videos_attributes: [:clip]
  end

  def correct_user
    @post = current_user.posts.find_by id: params[:id]
    redirect_to root_url if @post.nil?
  end
end

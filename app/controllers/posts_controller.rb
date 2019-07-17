class PostsController < ApplicationController
  before_action :logged_in_user, only: :create

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash.notice = t "create_success"
      redirect_to root_path
    else
      render "home/index"
    end
  end

  private

  def post_params
    params.require(:post).permit :content, :status,
      photos_attributes: [:image],
      videos_attributes: [:clip]
  end
end

class PostsController < ApplicationController
  before_action :logged_in_user, only: :create

  def create
    @post = current_user.posts.build post_params

    if @post.save
      check_multi :photos, :image
      check_multi :videos, :clip
      flash.notice = t "create_success"
      redirect_to root_path
    else
      flash.alert = t "create_fail"
      render "home/index"
    end
  end

  private

  def post_params
    params.require(:post).permit :content, :status, photos_attributes: [],
                                 videos_attributes: []
  end

  def check_multi table, attribute
    return unless params[table.to_s].present?
    params[table.to_s][attribute.to_s].each do |p|
      instance_variable_set "@#{table}",
        @post.send(table.to_s).create!(attribute.to_s => p)
    end
  end
end

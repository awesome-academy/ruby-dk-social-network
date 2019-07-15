class HomeController < ApplicationController
  def index
    return unless user_signed_in?

    @post = current_user.posts.build
    @photo = @post.photos.build
    @video = @post.videos.build
  end
end

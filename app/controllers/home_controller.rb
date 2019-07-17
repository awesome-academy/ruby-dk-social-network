class HomeController < ApplicationController
  def index
    if user_signed_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.page(params[:page]).per Settings.per_page
    else
      @feed_items = Post.public_posts.order_posts.page(params[:page]).per Settings.per_page
    end
  end
end

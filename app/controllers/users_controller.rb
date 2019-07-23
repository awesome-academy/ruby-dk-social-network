class UsersController < ApplicationController
  before_action :load_user, only: %i(edit show update)
  before_action :verify_user, only: %i(edit update)
  before_action :verify_admin, only: :index

  def index; end

  def show
    @posts = @user.posts.order_posts.page(params[:page]).per Settings.per_page
    @post = current_user.posts.build
  end

  def edit; end

  def update
    if current_user.update user_params
      redirect_to current_user
      flash.notice = t "users.edit.update_success"
    else
      render :edit
    end
  end

  private

  def verify_user
    break_out unless current_user? @user
  end

  def load_user
    @user = User.find_by id: params[:id]

    return if @user
    flash.alert = t "no_pages_found"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit :user_name, :name, :avatar,
      :website
  end
end

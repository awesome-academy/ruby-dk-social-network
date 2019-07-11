class UsersController < ApplicationController
  before_action :load_user, only: %i(edit show)
  before_action :verify_user, only: %i(edit update)
  before_action :verify_admin, only: :index

  def index; end

  def show; end

  def edit; end

  def update; end

  private

  def verify_user
    break_out unless current_user.present?
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

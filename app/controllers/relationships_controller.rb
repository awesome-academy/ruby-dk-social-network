class RelationshipsController < ApplicationController
  before_action :load_user, :default_follow_path, only: :show

  def show; end

  def create
    @user = User.find_by id: params[:followed_id]
    current_user.follow @user
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    current_user.un_follow @user
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  private

  def default_follow_path
    return false unless params[:follow_path].nil?
    params[:follow_path] = :followers
  end

  def load_user
    @user = User.find_by id: params[:id]

    return false unless @user.nil?
    flash.alert = t "no_pages_found"
    redirect_to root_path
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper

  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def break_out
    redirect_to root_path
    flash.alert = t "no_pages_found"
  end

  def verify_admin
    return if user_signed_in? && current_user.admin?
    break_out
  end
end

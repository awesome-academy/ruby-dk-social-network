class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.page(params[:page])
                                 .per Settings.per_page
  end
end

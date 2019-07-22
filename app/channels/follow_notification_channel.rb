class FollowNotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "follow_notification_channel_#{current_user.id}"
  end

  def unsubscribed; end
end

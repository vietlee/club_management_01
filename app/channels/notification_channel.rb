class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_channel"
  end

  def unsubscribed
  end

  def push data
    Notification.create! content: data
  end
end

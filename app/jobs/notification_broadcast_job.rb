class NotificationBroadcastJob < ApplicationJob
  queue_as :notify

  def perform notification
    ActionCable.server.broadcast "notification_channel",
      notification: render_notify(notification)
  end

  private
  def render_notify notification
    ApplicationController.renderer.render(partial: "notifications/notification",
      locals: {notification: notification})
  end
end

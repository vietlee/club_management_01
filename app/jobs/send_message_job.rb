class SendMessageJob < ApplicationJob
  queue_as :chat

  def perform message
    ActionCable.server.broadcast "club_#{message.club_id}_channel",
      message: render_message(message)
  end

  def render_message message
    ApplicationController.renderer.render partial: "messages/message",
      locals: {message: message}
  end
end

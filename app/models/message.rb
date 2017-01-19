class Message < ApplicationRecord
  belongs_to :user
  belongs_to :club

  after_create :send_message

  private
  def send_message
    SendMessageJob.perform_now self
  end
end

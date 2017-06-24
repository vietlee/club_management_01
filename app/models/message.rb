class Message < ApplicationRecord
  belongs_to :user
  belongs_to :club

  after_create :send_message

  scope :newest, ->{order created_at: :desc}

  delegate :full_name, to: :user, prefix: :user

  private
  def send_message
    SendMessageJob.perform_now self
  end
end

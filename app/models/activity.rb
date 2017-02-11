class Activity < ApplicationRecord
  belongs_to :trackable, polymorphic: true
  belongs_to :owner, polymorphic: true
  belongs_to :container, polymorphic: true

  enum read: {un_read: 0, readed: 1}

  after_create :push_notify

  scope :of_user_clubs, -> user_clubs {where container_id: user_clubs.map(&:club_id).uniq}
  scope :oder_by_read, -> {order read: :asc}

  private
  def push_notify
    NotificationBroadcastJob.perform_now self
  end
end

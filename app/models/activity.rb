class Activity < ApplicationRecord
  belongs_to :trackable, polymorphic: true
  belongs_to :owner, polymorphic: true
  belongs_to :container, polymorphic: true

  has_many :comments, as: :target, dependent: :destroy
  enum read: {un_read: 0, readed: 1}

  after_create :push_notify

  scope :of_user_clubs, ->user_clubs{where container_id: user_clubs.map(&:club_id).uniq}
  scope :oder_by_read, ->{order read: :asc}

  delegate :name, to: :container, prefix: :container, allow_nil: :true
  delegate :name, to: :trackable, prefix: :trackable, allow_nil: :true
  delegate :full_name, to: :owner, prefix: :owner, allow_nil: :true

  private
  def push_notify
    NotificationBroadcastJob.perform_now self, lists_received
  end

  def lists_received
    lists_received = self.container.users.try(:ids)
    lists_received.delete(self.owner_id)
    lists_received
  end
end

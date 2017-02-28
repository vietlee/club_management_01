class ClubRequest < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  has_many :activities, as: :target, dependent: :destroy

  enum status: {pending: 0, joined: 1, reject: 2}

  scope :order_date_desc, -> {order created_at: :desc}

  delegate :full_name, to: :user, allow_nil: :true

  mount_uploader :logo, ImageUploader
end

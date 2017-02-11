class News < ApplicationRecord
  has_many :comments, as: :target, dependent: :destroy
  has_many :activities, as: :target, dependent: :destroy
  has_many :notifications, as: :target, dependent: :destroy

  belongs_to :user
  belongs_to :event

  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: {minimum: Settings.min_title}
  validates :content, presence: true, length: {minimum: Settings.min_content}

  scope :newest, -> {order created_at: :desc}

  delegate :full_name, to: :user, allow_nil: :true
end

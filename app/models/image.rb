class Image < ApplicationRecord
  belongs_to :album
  belongs_to :user

  has_many :activities, as: :trackable, dependent: :destroy

  mount_uploader :url, ImageUploader

  validates :name, presence: true, length: {minimum: Settings.min_name}
  validates :url, presence: true

  scope :newest, -> {order created_at: :desc}
end

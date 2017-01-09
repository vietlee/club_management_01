class Event < ApplicationRecord
  has_many :news, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :comments, as: :target, dependent: :destroy
  has_many :activities, as: :target, dependent: :destroy

  belongs_to :club

  mount_uploader :image, ImageUploader

  scope :top_like, -> {order num_like: :desc}
  scope :newest, -> {order created_at: :desc}
end

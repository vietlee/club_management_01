class ClubRequest < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  has_many :activities, as: :target, dependent: :destroy

  mount_uploader :logo, ImageUploader
end

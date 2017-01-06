class OrganizationRequest < ApplicationRecord
  belongs_to :user
  has_many :activities, as: :target, dependent: :destroy

  mount_uploader :image, ImageUploader
end

class Organization < ApplicationRecord
  has_many :clubs, dependent: :destroy
  has_many :users, through: :user_organizations
  has_many :user_organizations, dependent: :destroy
  has_many :activities, as: :target, dependent: :destroy
  has_many :user_organizations, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.max_name}
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :location, presence: true
  validates :description, presence: true

  mount_uploader :logo, ImageUploader

  scope :newest, -> {order created_at: :desc}
end

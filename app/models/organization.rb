class Organization < ApplicationRecord
  has_many :clubs, dependent: :destroy
  has_many :users, through: :user_organizations
  has_many :user_organizations, dependent: :destroy
  has_many :club_requests, dependent: :destroy
  has_many :notifications, as: :target, dependent: :destroy
  has_many :activities, as: :container, dependent: :destroy
  has_many :activities, as: :trackable, dependent: :destroy

  validates :name, uniqueness: true, presence: true,
    length: {maximum: Settings.max_name}
  validates :email, uniqueness: true, presence: true
  validates :phone, presence: true
  validates :location, presence: true
  validates :description, presence: true

  mount_uploader :logo, ImageUploader

  scope :newest, ->{order created_at: :desc}
  scope :by_user_organizations, ->user_organizations do
    where id: user_organizations.map(&:organization_id)
  end
end

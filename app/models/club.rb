class Club < ApplicationRecord
  has_many :user_clubs, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :users, through: :user_clubs
  has_many :target_hobbies_tags, as: :target, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :ratings, as: :rateable
  has_many :notifications, as: :target, dependent: :destroy
  has_many :activities, as: :trackable, dependent: :destroy
  has_many :activities, as: :container, dependent: :destroy

  belongs_to :organization

  mount_uploader :image, ImageUploader
  mount_uploader :logo, ImageUploader

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true,
    length: {minimum: Settings.min_description}

  scope :actives, -> {where is_active: true}
  scope :of_userclubs, -> userclubs {where id: userclubs.map(&:club_id)}
  scope :newest, -> {order created_at: :desc}
  scope :without_clubs, -> clubs {where.not(id: clubs.ids)}
  scope :of_organizations, -> organizations do
    where(organization_id: organizations.ids)
  end
end

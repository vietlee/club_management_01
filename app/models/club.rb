class Club < ApplicationRecord
  has_many :user_clubs, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :users, through: :user_clubs
  has_many :target_hobbies_tags, as: :target, dependent: :destroy
  has_many :activities, as: :target
  has_many :messages, dependent: :destroy
  has_many :ratings, as: :rateable

  belongs_to :organization

  mount_uploader :image, ImageUploader
  mount_uploader :logo, ImageUploader

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true,
    length: {minimum: Settings.min_description}

  scope :actives, -> {where status: true}

  def manager_club
    user_clubs.manager
  end
end

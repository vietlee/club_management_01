class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  has_many :user_clubs, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :images
  has_many :comments, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :target_hobbies_tags, as: :target

  belongs_to :organization

  mount_uploader :avatar, AvatarUploader

  validates :full_name, presence: true, length: {maximum: Settings.max_name}
  validates :password, presence: true, length: {minimum: Settings.min_password}

  enum role: {company_admin: 1}

end

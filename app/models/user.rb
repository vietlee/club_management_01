class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  has_many :ratings, as: :rateable
  has_many :user_organizations, dependent: :destroy
  has_many :organizations, through: :user_organizations
  has_many :user_organizations, dependent: :destroy
  has_many :user_clubs, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :club_requests, dependent: :destroy
  has_many :organization_requests, dependent: :destroy
  has_many :images
  has_many :comments, dependent: :destroy
  has_many :reason_leaves, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :clubs, through: :user_clubs
  has_many :events, through: :user_events
  has_many :notifications, as: :target, dependent: :destroy
  has_many :target_hobbies_tags, as: :target, dependent: :destroy
  has_many :activities, as: :person_target, dependent: :destroy
  has_many :messages, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  scope :newest, -> {order created_at: :desc}
  scope :eliminate, -> user {where.not id: user.id}
  scope :payment_not_yet, -> budgets {where.not id: budgets.map(&:user_id)}

  validates :full_name, presence: true, length: {maximum: Settings.max_name}
  validates :password, presence: true, length: {minimum: Settings.min_password}, on: :create
end

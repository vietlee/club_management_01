class ClubRequest < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  has_many :activities, as: :target, dependent: :destroy

  serialize :time_activity, Array

  enum status: {pending: 0, joined: 1, reject: 2}
  enum club_type: {sport: 1, game: 2, education: 3, music: 4,
    entertainment: 5, confidential: 6, junket: 7, other: 0}

  validates :name, presence: true, uniqueness: true,
    length: {maximum: Settings.club_request.max_name_length}
  validates :content, presence: true,
    length: {minimum: Settings.club_request.min_content_length,
      maximum: Settings.club_request.max_content_length}
  validates :member,
    numericality: { less_than_or_equal_to: Settings.club_request.max_member }
  validates :goal, presence: true,
    length: { minimum: Settings.club_request.min_goal_length,
      maximum: Settings.club_request.max_goal_length}
  validates :rules, length: {maximum: Settings.club_request.max_rules_length}
  validates :rule_finance, length: {maximum: Settings.club_request.max_rule_finance_length}
  validates :punishment, length: {maximum: Settings.club_request.max_punishment_length}
  validates :local, length: {maximum: Settings.club_request.max_local_length}
  validates :plan, length: {maximum: Settings.club_request.max_plan_length}

  delegate :full_name, to: :user, allow_nil: :true

  scope :order_date_desc, -> {order created_at: :desc}

  delegate :full_name, to: :user, allow_nil: :true

  mount_uploader :logo, ImageUploader
end

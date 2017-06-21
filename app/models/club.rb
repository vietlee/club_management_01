class Club < ApplicationRecord
  acts_as_taggable

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

  serialize :time_activity, Array

  validates :name, presence: true, uniqueness: true
  validates :content, presence: true,
    length: {minimum: Settings.club.min_content_length,
      maximum: Settings.club.max_content_length}
  validates :goal, presence: true,
    length: {minimum: Settings.club.min_goal_length,
      maximum: Settings.club.max_goal_length}
  validates :goal, presence: true,
    length: {minimum: Settings.club.min_goal_length,
      maximum: Settings.club.max_goal_length}
  validates :rules, length: {maximum: Settings.club.max_rules_length}
  validates :rule_finance,
    length: {maximum: Settings.club.max_rule_finance_length}
  validates :punishment,
    length: {maximum: Settings.club.max_punishment_length}
  validates :plan, length: {maximum: Settings.club.max_plan_length}

  enum club_type: {hobbies: 8, sport: 1, game: 2, education: 3, music: 4,
    entertainment: 5, confidential: 6, junket: 7, other: 0}

  scope :actives, -> {where is_active: true}
  scope :of_user_clubs, -> user_clubs {where id: user_clubs.map(&:club_id)}
  scope :newest, -> {order created_at: :desc}
  scope :without_clubs, -> clubs {where.not(id: clubs.ids)}
  scope :of_organizations, -> organizations do
    where(organization_id: organizations.ids)
  end

  delegate :name, to: :organization, prefix: :club, allow_nil: :true

  def calculate_change_budget event
    self.update_attributes money: self.money.to_i - event.expense.to_i
  end

  def calculate_get_budget event, size_member
    self.update_attributes money: size_member*event.expense.to_i + self.money.to_i
  end

  def pay_money_change event, change
    self.update_attributes money: self.money.to_i + (event.expense.to_i - change.to_i)
  end

  def rating_club club
    self.rating.round.times do
      "<i class='fa fa-star'></i>".html_safe
    end
  end

  def money_pay club, money
    self.update_attributes money: self.money - money
  end

  def money_subsidy club, money
    self.update_attributes money: self.money + money
  end

  def subsidy_money_change event, change
    self.update_attributes money: self.money.to_i + (change.to_i - event.expense.to_i)
  end
end

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
end

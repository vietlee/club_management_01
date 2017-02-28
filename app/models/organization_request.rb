class OrganizationRequest < ApplicationRecord
  belongs_to :user
  has_many :activities, as: :target

  enum status: {pending: 0, joined: 1, reject: 2}

  mount_uploader :logo, ImageUploader

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :description, presence: true
  validates :phone, presence: true

  delegate :full_name, to: :user, allow_nil: :true

  scope :unapprove, ->{where approve: false}
  scope :newest, -> {order created_at: :desc}
end

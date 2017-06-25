class Album < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :activities, as: :trackable, dependent: :destroy

  belongs_to :club

  validates :name, presence: true, length: {minimum: Settings.min_name}

  scope :newest, ->{order created_at: :desc}
  accepts_nested_attributes_for :images
end

class Organization < ApplicationRecord
  has_many :clubs, dependent: :destroy
  has_many :users, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.max_name}
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :location, presence: true
  validates :description, presence: true
end

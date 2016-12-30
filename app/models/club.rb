class Club < ApplicationRecord
  has_many :user_clubs, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :requests, as: :target, dependent: :destroy
  has_many :target_hobbies_tags, as: :target

  belongs_to :organization
end

class Event < ApplicationRecord
  has_many :news, dependent: :destroy
  has_many :user_events, dependent: :destroy

  belongs_to :club
end

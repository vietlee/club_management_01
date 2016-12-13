class User < ApplicationRecord
  has_many :user_clubs
  has_many :user_events
  has_many :requests
  has_many :activities
  has_many :images
  has_many :comments
  has_many :news

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
end

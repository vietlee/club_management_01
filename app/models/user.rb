class User < ApplicationRecord
  has_many :user_clubs, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :images
  has_many :comments, dependent: :destroy
  has_many :news, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
end

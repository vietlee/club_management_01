class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :activities, as: :trackable, dependent: :destroy
end

class News < ApplicationRecord
  has_many :comments, as: :target, dependent: :destroy
  has_many :activities, as: :target, dependent: :destroy

  belongs_to :user
  belongs_to :event
end

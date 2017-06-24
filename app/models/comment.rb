class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :target, polymorphic: true

  scope :newest, ->{order created_at: :desc}
end

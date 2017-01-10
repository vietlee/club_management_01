class UserClub < ApplicationRecord
  belongs_to :user
  belongs_to :club

  scope :manager, ->{where is_manager: true}
  scope :unactive, ->{where status: false}

  delegate :name, to: :club, allow_nil: :true
end

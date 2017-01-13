class UserClub < ApplicationRecord
  belongs_to :user
  belongs_to :club

  scope :manager, ->{where is_manager: true}
  scope :unactive, ->{where status: false}
  scope :user_club, ->club_id do
    where club_id: club_id
  end

  delegate :name, to: :club, allow_nil: :true
end

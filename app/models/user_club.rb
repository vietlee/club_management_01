class UserClub < ApplicationRecord
  belongs_to :user
  belongs_to :club

  enum status: {pending: 0, joined: 1, reject: 2}

  scope :manager, ->{where is_manager: true}
  scope :unactive, ->{where status: false}
  scope :user_club, ->club_id do
    where club_id: club_id
  end
  scope :find_with_user_of_club, ->user_id, club_id do
    find_by user_id: user_id, club_id: club_id
  end

  delegate :name, to: :club, allow_nil: :true
  delegate :full_name, :avatar, :email, :phone, to: :user, allow_nil: :true
end

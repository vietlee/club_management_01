class UserClub < ApplicationRecord
  belongs_to :user
  belongs_to :club

  enum status: {pending: 0, joined: 1, reject: 2}

  scope :manager, -> {where is_manager: true}
  scope :unactive, -> {where.not(status: UserClub.statuses[:joined])}
  scope :user_club, -> club_id do
    where club_id: club_id
  end
  scope :find_with_user_of_club, -> user_id, club_id do
    find_by user_id: user_id, club_id: club_id
  end

  class << self
    def of_club club
      find_by club: club
    end
  end

  delegate :name, :logo, :notification, :money, to: :club, allow_nil: :true
  delegate :full_name, :avatar, :email, :phone, to: :user, allow_nil: :true
end

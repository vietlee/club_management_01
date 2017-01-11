class UserOrganization < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  scope :are_admin, ->{where is_admin: true}

  delegate :name, to: :organization, allow_nil: :true
end

class UserOrganization < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  delegate :name, to: :organization, allow_nil: :true
end

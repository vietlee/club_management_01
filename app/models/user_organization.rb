class UserOrganization < ApplicationRecord
  belongs_to :user
  belongs_to :organiztion
end

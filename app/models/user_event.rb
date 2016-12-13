class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :club
end

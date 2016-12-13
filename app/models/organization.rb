class Organization < ApplicationRecord
  has_many :clubs, dependent: :destroy
end

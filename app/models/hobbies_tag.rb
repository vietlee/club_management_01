class hobbiesTag < ApplicationRecord
  has_many :club_hobbies_tags, dependent: :destroy
  has_many :user_hobbies_tags, dependent: :destroy
end

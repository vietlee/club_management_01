class HobbiesTag < ApplicationRecord
  has_many :target_hobbies_tags, dependent: :destroy
end

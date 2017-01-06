class hobbiesTag < ApplicationRecord
  has_many :target_hobbies_tags, dependent: :destroy
end

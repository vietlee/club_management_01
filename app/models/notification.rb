class Notification < ApplicationRecord
  belongs_to :target, polymorphic: true
end

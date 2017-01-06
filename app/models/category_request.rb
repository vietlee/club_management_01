class CategoryRequest < ApplicationRecord
  has_many :requests, dependent: :destroy
end

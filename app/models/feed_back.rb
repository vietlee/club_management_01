class FeedBack < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: {minimum: Settings.min_content}

  enum type_feed_back: [:other, :web_content, :process, :ui]

  scope :newest, -> {order created_at: :desc}
end

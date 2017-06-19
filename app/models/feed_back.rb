class FeedBack < ApplicationRecord
  belongs_to :user

  validates :content, presence: true,
    length: {minimum: Settings.feed_back.min_content,
      maximum: Settings.feed_back.max_content}

  enum type_feed_back: [:other, :web_content, :process, :ui]

  scope :newest, -> {order created_at: :desc}
end

class CreateFeedBacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feed_backs do |t|
      t.string :content
      t.integer :user_id
      t.integer :type_feed_back, default: 0

      t.timestamps
    end
  end
end

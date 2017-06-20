class AddDescriptionToFeedBacks < ActiveRecord::Migration[5.0]
  def change
    add_column :feed_backs, :description, :text
  end
end

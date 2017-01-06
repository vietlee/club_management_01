class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :target_id
      t.string :target_type
      t.text :content
      t.string :url
      t.boolean :read, default: false
      t.timestamps
    end
  end
end

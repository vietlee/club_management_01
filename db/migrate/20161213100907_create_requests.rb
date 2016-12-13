class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :category_request, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :target_id
      t.string :target_type
      t.string :content
      t.date :date_start
      t.string :duration
      t.string :location
      t.boolean :approve, default: false
      t.timestamps
    end
  end
end

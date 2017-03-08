class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :expense, default: 0
      t.references :club, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :event_category, default: 0
      t.date :date_start
      t.date :date_end
      t.text :location
      t.integer :num_like, default: 0
      t.string :image
      t.integer :status, default: 0
      t.string :month_of_payment
      t.integer :amount
      t.timestamps
    end
  end
end

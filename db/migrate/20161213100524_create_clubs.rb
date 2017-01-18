class CreateClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs do |t|
      t.references :organization, foreign_key: true
      t.string :name
      t.text :notification
      t.text :description
      t.integer :money, default: 0
      t.float :rating, default: 0.0
      t.boolean :is_active, default: true
      t.string :logo
      t.string :image
      t.timestamps
    end
  end
end

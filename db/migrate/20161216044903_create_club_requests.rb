class CreateClubRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :club_requests do |t|
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.text :description
      t.string :action
      t.string :logo
      t.boolean :approve, default: false
      t.timestamps
    end
  end
end

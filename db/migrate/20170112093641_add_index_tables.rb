class AddIndexTables < ActiveRecord::Migration[5.0]
  def change
    add_index :user_events, [:user_id, :event_id], unique: true
    add_index :user_clubs, [:user_id, :club_id], unique: true
    add_index :user_organizations, [:user_id, :organization_id], unique: true
  end
end

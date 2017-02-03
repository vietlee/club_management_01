class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :trackable, polymorphic: true
      t.belongs_to :owner, polymorphic: true
      t.string :key
      t.text :parameters
      t.belongs_to :container, polymorphic: true
      t.integer :read, default: false
      t.integer :recipt_type, default: 0
      t.timestamps
    end

    add_index :activities, [:trackable_id, :trackable_type]
    add_index :activities, [:owner_id, :owner_type]
    add_index :activities, [:container_id, :container_type]
  end
end

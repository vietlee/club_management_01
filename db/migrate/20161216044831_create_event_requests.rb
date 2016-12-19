class CreateEventRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :event_requests do |t|

      t.timestamps
    end
  end
end

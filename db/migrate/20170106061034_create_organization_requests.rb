class CreateOrganizationRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_requests do |t|
      t.string :name
      t.text :description
      t.string :phone
      t.string :email
      t.text :location
      t.string :image
      t.boolean :status, default: false
      t.timestamps
    end
  end
end

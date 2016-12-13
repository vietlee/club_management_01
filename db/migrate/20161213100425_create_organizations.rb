class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :description
      t.string :phone
      t.string :email
      t.string :location
      t.timestamps
    end
  end
end

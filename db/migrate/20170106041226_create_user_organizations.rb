class CreateUserOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_organizations do |t|
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 0
      t.boolean :is_admin, default: false
      t.timestamps
    end
  end
end

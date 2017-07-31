class AddStatusToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :status, :integer, default: 0
  end
end

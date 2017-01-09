class AddLogoToClubs < ActiveRecord::Migration[5.0]
  def change
    add_column :clubs, :logo, :string
  end
end

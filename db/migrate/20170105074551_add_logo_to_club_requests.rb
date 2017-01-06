class AddLogoToClubRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :club_requests, :logo, :string
  end
end

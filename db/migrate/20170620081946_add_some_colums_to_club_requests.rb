class AddSomeColumsToClubRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :club_requests, :member, :integer
    add_column :club_requests, :goal, :text
    add_column :club_requests, :local, :string
    add_column :club_requests, :content, :text
    add_column :club_requests, :time_activity, :string
    add_column :club_requests, :rules, :text
    add_column :club_requests, :rule_finance, :text
    add_column :club_requests, :time_join, :text
    add_column :club_requests, :punishment, :text
    add_column :club_requests, :plan, :text
  end
end

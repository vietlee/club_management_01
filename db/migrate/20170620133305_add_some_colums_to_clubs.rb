class AddSomeColumsToClubs < ActiveRecord::Migration[5.0]
  def change
    add_column :clubs, :member, :integer
    add_column :clubs, :goal, :text
    add_column :clubs, :local, :string
    add_column :clubs, :content, :text
    add_column :clubs, :time_activity, :string
    add_column :clubs, :rules, :text
    add_column :clubs, :rule_finance, :text
    add_column :clubs, :time_join, :text
    add_column :clubs, :punishment, :text
    add_column :clubs, :plan, :text
  end
end

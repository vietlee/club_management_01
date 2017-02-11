class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.references :event, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.datetime :budgets_date, null: false
      t.integer :money, null: false
      t.timestamps
    end
  end
end

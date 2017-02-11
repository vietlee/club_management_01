class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.references :event, foreign_key: true
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end

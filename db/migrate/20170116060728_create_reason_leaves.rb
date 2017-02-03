class CreateReasonLeaves < ActiveRecord::Migration[5.0]
  def change
    create_table :reason_leaves do |t|
      t.references :user, foreign_key: true
      t.references :club, foreign_key: true
      t.text :content
      t.timestamps
    end
  end
end

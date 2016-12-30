class CreateTargetHobbiesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :target_hobbies_tags do |t|
      t.string :hobbies_tag
      t.integer :target_id
      t.string :target_type

      t.timestamps
    end
  end
end

class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :group_id
      t.string :group_name
      t.integer :user_id

      t.timestamps
    end
  end
end

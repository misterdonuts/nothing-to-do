class CreateGroupRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :group_relations do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end

class CreateGroupInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :group_invitations do |t|
      t.integer :group_id
      t.integer :user_id
      t.integer :sender_id
      t.integer :status

      t.timestamps
    end
  end
end

class RenameColumnGroupInvitation < ActiveRecord::Migration[5.2]
  def change
  	rename_column :group_invitations, :sender_id, :receiver_id
  end
end

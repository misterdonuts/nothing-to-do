class AddInvitationGroupIdToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :invitation_group_id, :integer
  end
end

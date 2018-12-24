class RenameColumnInvitationRelations < ActiveRecord::Migration[5.2]
  def change
  	rename_column :invitation_relations, :invitation_group_id, :invitation_id
  end
end

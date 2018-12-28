class ChangeColumnToInvitationRelation < ActiveRecord::Migration[5.2]
  def change
  	rename_column :invitation_relations, :sender_id, :receiver_id
  end
end

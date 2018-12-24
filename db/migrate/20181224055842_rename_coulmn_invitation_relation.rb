class RenameCoulmnInvitationRelation < ActiveRecord::Migration[5.2]
  def change
  	rename_column :invitation_relations, :receiver_id, :user_id
  end
end

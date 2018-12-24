class AddColumnInvitationRelations < ActiveRecord::Migration[5.2]
  def change
  	add_column :invitation_relations, :status, :integer
  end
end

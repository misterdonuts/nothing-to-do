class AddColumnToInvitation < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :user_id, :integer
  end
end

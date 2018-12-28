class AddReceiverToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :receiver, :integer
  end
end

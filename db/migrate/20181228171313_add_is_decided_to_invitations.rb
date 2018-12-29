class AddIsDecidedToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :is_decided, :integer
  end
end

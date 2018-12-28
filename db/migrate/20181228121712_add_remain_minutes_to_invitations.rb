class AddRemainMinutesToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :remain_minutes, :integer
  end
end

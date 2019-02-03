# frozen_string_literal: true

class RemoveColumnInvitations < ActiveRecord::Migration[5.2]
  def change
    remove_column :invitations, :invitation_id, :integer
  end
end

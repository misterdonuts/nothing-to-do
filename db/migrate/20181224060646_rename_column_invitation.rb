# frozen_string_literal: true

class RenameColumnInvitation < ActiveRecord::Migration[5.2]
  def change
    rename_column :invitations, :invitation_group_id, :invitation_id
  end
end

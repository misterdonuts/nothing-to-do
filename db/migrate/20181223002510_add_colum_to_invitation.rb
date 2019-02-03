# frozen_string_literal: true

class AddColumToInvitation < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :invitation_group_id, :integer
  end
end

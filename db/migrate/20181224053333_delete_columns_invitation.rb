# frozen_string_literal: true

class DeleteColumnsInvitation < ActiveRecord::Migration[5.2]
  def change
    remove_column :invitations, :receiver, :integer
    remove_column :invitations, :accept, :integer
  end
end

# frozen_string_literal: true

class CreateInvitationRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitation_relations do |t|
      t.integer 'invitation_group_id'
      t.integer 'sender_id'
      t.integer 'receiver_id'

      t.timestamps
    end
  end
end

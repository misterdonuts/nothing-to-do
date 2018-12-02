class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.integer :sender
      t.integer :reciever
      t.text :contents
      t.boolean :accept
      t.string :timelimit
      t.string :datetime

      t.timestamps
    end
  end
end

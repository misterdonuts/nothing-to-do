class RenameReceiverColumn < ActiveRecord::Migration[5.2]
  def change
  	rename_column :invitations, :reciever, :receiver
  end
end

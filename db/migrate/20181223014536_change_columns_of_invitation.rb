class ChangeColumnsOfInvitation < ActiveRecord::Migration[5.2]
  def change
  	remove_column :invitations, :sender, :string
  	remove_column :invitations, :createtime, :integer
  	rename_column :invitations, :timelimit, :time_limit
  end
end

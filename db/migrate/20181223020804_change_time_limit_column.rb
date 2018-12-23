class ChangeTimeLimitColumn < ActiveRecord::Migration[5.2]
  def change
  	remove_column :invitations, :time_limit, :integer
    add_column :invitations, :time_limit, :datetime, null: false
  end
end

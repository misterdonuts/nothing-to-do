class ChangeColumnUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :is_free, :integer, :default => 1
  end
end

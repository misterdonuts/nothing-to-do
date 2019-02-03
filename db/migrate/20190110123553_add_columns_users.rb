# frozen_string_literal: true

class AddColumnsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :status, :integer
    add_column :users, :account_name, :string
  end
end

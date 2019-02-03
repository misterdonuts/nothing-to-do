# frozen_string_literal: true

class RenameAccountNameToEmail < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :account_name, :email
  end
end

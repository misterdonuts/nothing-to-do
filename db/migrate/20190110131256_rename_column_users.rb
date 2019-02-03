# frozen_string_literal: true

class RenameColumnUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :status, :is_free
  end
end

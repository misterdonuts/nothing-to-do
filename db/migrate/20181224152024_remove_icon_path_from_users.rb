# frozen_string_literal: true

class RemoveIconPathFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :icon_path, :string
  end
end

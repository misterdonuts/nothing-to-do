# frozen_string_literal: true

class AddDefaultValueUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :invite_num, :integer, default: 0
    change_column :users, :be_invited_num, :integer, default: 0
    change_column :users, :accept_num, :integer, default: 0
  end
end

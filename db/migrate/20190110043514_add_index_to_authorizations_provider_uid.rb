# frozen_string_literal: true

class AddIndexToAuthorizationsProviderUid < ActiveRecord::Migration[5.2]
  def change
    add_index :authorizations, %i[provider uid], unique: true
  end
end

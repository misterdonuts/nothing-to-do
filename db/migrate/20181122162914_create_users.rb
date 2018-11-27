class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :account_name
      t.string :user_name
      t.string :icon_path
      t.integer :invite_num
      t.integer :be_invited_num
      t.integer :accept_num

      t.timestamps
    end
  end
end

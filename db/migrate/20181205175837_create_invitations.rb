# frozen_string_literal: true

class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.integer :sender           # 送信者のユーザーid
      t.integer :reciever         # 受信者のユーザーid
      t.text :contents            # 送信内容
      t.integer :accept           # 承諾:1 拒否:-1 メッセージ受信状態(通知用):0
      t.integer :timelimit        # 時間切れまでのUNIXタイムスタンプ
      t.integer :createtime       # 作成日UNIXタイムスタンプ

      t.timestamps
    end
  end
end

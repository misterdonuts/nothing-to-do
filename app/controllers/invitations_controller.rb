class InvitationsController < ApplicationController

#  招待アクション
  def get
    # ログインユーザー取得
    @user = User.find(session[:user_id])
    # 招待相手を取得
    @recievers = User.find(params[:user][:id])

    # render plain: params.inspect
  end


#  招待メールの作成アクション
  def create

    # ログインユーザー取得
    @sender = User.find(session[:user_id])
    # 招待相手を取得
    @recievers = User.find(params[:recievers][:id])

    begin
      @recievers.each do |reciever|
        Invitation.create(
          sender: @sender.id,
          reciever: reciever.id,
          contents: params[:text],
          accept: 0,
          timelimit: (Time.now.to_i + (60 * 60 * 2)), # 現在日時＋2時間
          createtime: Time.now.to_i, # UNIXタイムスタンプ
          user_id: @sender.id,
        )
      end
    rescue => e
      redirect_to invitations_path
    end

    redirect_to root_path and return

  end
end

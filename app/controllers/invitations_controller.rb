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
    
    # 設定するinvitation_group_idの取得
    max_invitation_group_id = Invitation.maximum(:invitation_group_id)
    if max_invitation_group_id.blank?
      next_invitation_group_id = 1
    else
      next_invitation_group_id = max_invitation_group_id + 1
    end

    begin
      @recievers.each do |reciever|
        Invitation.create(
          sender: @sender.id,
          reciever: reciever.id,
          contents: params[:text],
          accept: 0,
          timelimit: (Time.now.to_i + (60 * 60 * 2)), # 現在日時＋2時間
          createtime: Time.now.to_i, # UNIXタイムスタンプ
          user_id: reciever.id,
          invitation_group_id: next_invitation_group_id,
        )
      end
    rescue => e
      p e
      redirect_to invitations_path
    end

    redirect_to root_path

  end
end

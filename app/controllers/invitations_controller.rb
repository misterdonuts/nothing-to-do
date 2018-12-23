class InvitationsController < ApplicationController

#  招待アクション
  def get
    # ログインユーザー取得
    @user = User.find(session[:user_id])
    # 招待相手を取得
    @receivers = User.find(params[:user][:id])

    # render plain: params.inspect
  end


#  招待メールの作成アクション
  def create

    # ログインユーザー取得
    @sender = User.find(session[:user_id])
    # 招待相手を取得
    @receivers = User.find(params[:receivers][:id])
    
    # 設定するinvitation_group_idの取得
    max_invitation_group_id = Invitation.maximum(:invitation_group_id)
    if max_invitation_group_id.blank?
      next_invitation_group_id = 1
    else
      next_invitation_group_id = max_invitation_group_id + 1
    end

    begin
      @receivers.each do |receiver|
        Invitation.create(
          receiver: receiver.id,
          contents: params[:text],
          accept: 0,
          time_limit: (Time.now.to_i + (60 * 60 * 2)), # 現在日時＋2時間
          user_id: receiver.id,
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

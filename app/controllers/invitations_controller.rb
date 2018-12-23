class InvitationsController < ApplicationController

  # 招待アクション
  def index
    # ログインユーザー取得
    @user = User.find(session[:user_id])
    # 招待相手を取得
    @receivers = User.find(params[:user][:id])

    # render plain: params.inspect
  end

  # 招待確認
  # GET /invitations/1
  def show
    @user = User.find(session[:user_id])
    @invitation = Invitation.where(invitation_group_id: params[:id], receiver: session[:user_id]).first
    @invited_users = User.where(id: Invitation.where(invitation_group_id: params[:id]).select(:receiver))
  end

  # 招待承諾, 辞退
  # /invitations/1
  def update
    invitation = Invitation.Invitation.where(invitation_group_id: params[:id], receiver: session[:user_id]).first
    begin
      invitation.update(accept: params[:status])
    rescue => e
      p e
    end
    redirect_to root_path
  end



  # 招待メールの作成アクション
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
          time_limit: DateTime.now + Rational(2,24), # 現在日時＋2時間
          user_id: session[:user_id],
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

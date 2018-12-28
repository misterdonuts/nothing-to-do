class InvitationsController < ApplicationController

  # 招待アクション
  def index
    # ログインユーザー取得
    @user = User.find(session[:user_id])
    # 招待相手を取得
    if params[:user].nil?
      redirect_to root_url
    else
      @receivers = User.find(params[:user][:id])
    end
    # render plain: params.inspect
  end

  # 招待確認
  # GET /invitations/1
  def show
    # @user = User.find(session[:user_id])
    # @invitation = Invitation.find_by(id: params[:id])
    # @invited_users = User.where(id: InvitationRelation.where(invitation_id: params[:id]).select(:user_id))
  end

  # 招待承諾, 辞退
  # /invitations/1
  def update
    # invitation = Invitation.where(invitation_group_id: params[:id], receiver: session[:user_id]).first
    # begin
    #   invitation.update(accept: params[:status])
    # rescue => e
    #   p e
    # end
    # redirect_to invitation_path
  end



  # 招待メールの作成アクション
  def create

    # ログインユーザー取得
    @sender = User.find(session[:user_id])
    # 招待相手を取得
    @receivers = User.find(params[:receivers][:id])


    begin
      invitation = Invitation.new(
        contents: params[:text],
        time_limit: DateTime.now + Rational(params[:time_span],24), # 現在日時＋2時間
        user_id: session[:user_id],
      )
      invitation.save!

      @receivers.each do |receiver|
        relation = InvitationRelation.new(
          invitation_id: invitation.id,
          receiver_id: session[:user_id],
          user_id: receiver.id,  # リレーションのカラムの方をsenderにする
          status: 0,
        )
        relation.save!
      end
    rescue => e
      p e
      redirect_to invitations_url
    end

    redirect_to root_url

  end
end

class InvitationsController < ApplicationController

  # 幹事情報画面
  def index
    @user = User.find(session[:user_id])
    @invitations = Invitation.where(user_id: session[:user_id])
    @invitations.each { |i|
      # unixタイムスタンプにして残時間を計算
      remain_minutes = i.time_limit.to_time.to_i - Time.now.to_i
      remain_minutes = remain_minutes / 60 # second => minutes
      i.update(remain_minutes: remain_minutes)
    }
    # headerのメッセージ表示用
    @invitation_relations = InvitationRelation.where(user_id: session[:user_id])
  end

  # 招待アクション
  def new
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

  def update
    user = User.find(session[:user_id])
    invitation = Invitation.find(params[:id])
    @invitation_relations = InvitationRelation.where(invitation_id: invitation.id)

    # 招待を破棄時
    if params[:decision] == '0'
      invitation.destroy

    # 招待を締結時
    elsif  params[:decision] == '1'
      # 締結フラグを立てる
      invitation.update(is_decided: 1)

      # 招待された側の情報を更新
      @invitation_relations.each { |relation|
        receiver =  User.find(relation.user_id)
        # 参加者は暇率の数を更新
        accept_num = receiver.accept_num
        if relation.status == 1
          accept_num += 1
        end
        # 招待された側は参加の有無に依らず誘われた数を更新
        be_invited_num = receiver.be_invited_num
        be_invited_num += 1
        receiver.update(accept_num: accept_num, be_invited_num: be_invited_num)
      }
      # 幹事は幹事回数を更新
      invite_num = user.invite_num
      invite_num += 1
      user.update(invite_num: invite_num)
    end
    redirect_to invitations_url
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
          sender_id: session[:user_id],
          user_id: receiver.id,
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

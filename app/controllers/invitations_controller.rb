class InvitationsController < ApplicationController
  def post
    # ログインユーザー取得
    @user = User.find(session[:user_id])
    # 招待相手を取得
    @recievers = User.find(params[:user][:id])

    # render plain: params.inspect

  end
  def index
    # ログインユーザー取得
    @user = User.find(session[:user_id])
    # 招待相手を取得
    # @recievers = User.find(params[:user][:id])

    # render plain: params.inspect

  end
end

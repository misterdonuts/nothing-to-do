# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    auth = request.env['omniauth.auth']
    if auth.present?
      unless @auth = Authorization.find_from_auth(auth)
        @auth = Authorization.create_from_auth(auth)
      end
      user = @auth.user
      log_in user
      redirect_to root_path
    else
      user = User.find_by(email: params[:session][:email].downcase)
      if Authorization.find_by(user_id: user.id)
        @message = 'googleでログインしてください'
        redirect_to new_session_path
      end
      if user&.authenticate(params[:session][:password])
        log_in user
        redirect_to root_path
      else
        @message = 'mailまたはパスワードが違います'
        redirect_to new_session_path
      end
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end

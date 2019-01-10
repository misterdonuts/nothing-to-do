class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    if auth.present?
      unless @auth = Authorization.find_from_auth(auth)
        @auth = Authorization.create_from_auth(auth)
      end
      user = @auth.user
      redirect_back_or user
    else
      user = User.find_by(email:params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to root_path
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end

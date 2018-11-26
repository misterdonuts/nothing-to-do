class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email:params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# login and redirect to mypage
  	else
  		# create error message
  		render 'new'
  	end
  end

  def destroy
  	
  end
end

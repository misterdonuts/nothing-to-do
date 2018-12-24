class InvitationRelationsController < ApplicationController

	# 招待情報の表示
	def show
    	@user = User.find(session[:user_id])
    	@invitation = Invitation.find_by(id: params[:id])
    	@invited_users = User.where(id: InvitationRelation.where(invitation_id: params[:id]).select(:user_id))
  	end
end

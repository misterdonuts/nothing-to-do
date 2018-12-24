class InvitationRelationsController < ApplicationController

	# 招待情報の表示
	def show
    	@user = User.find(session[:user_id])
    	@invitation = Invitation.find_by(id: params[:id])
    	@invited_users = User.where(id: InvitationRelation.where(invitation_id: params[:id]).select(:user_id))
  	end


  	# 招待情報の更新
  	def update
    	invitation_relation = InvitationRelation.where(invitation_id: params[:id], user_id: session[:user_id])
    	begin
      		invitation_relation.update(status: params[:status])
    	rescue => e
      		p e
    	end
    	redirect_to invitation_relation_path
  	end
end

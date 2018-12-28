class InvitationRelationsController < ApplicationController
	# 招待情報一覧
	def index
		@invitation_relations = InvitationRelation.where(user_id: session[:user_id])
		@invitations = Invitation.where(id: @invitation_relations.map{|relation| relation.invitation_id})
		@invitations.each { |i|
			# unixタイムスタンプにして残時間を計算
			p i.time_limit.to_time.to_i
			p Time.now.to_i
			remain_minutes = i.time_limit.to_time.to_i - Time.now.to_i
			remain_minutes = remain_minutes / 60 # second => minutes
			i.update(remain_minutes: remain_minutes)
		}

	end

	  # 各招待情報の表示
	def show
    @user = User.find(session[:user_id])
    @invitation = Invitation.find_by(id: params[:id])
    @invited_users = User.where(id: InvitationRelation.where(invitation_id: params[:id]).select(:user_id))
    @invitation_relation = InvitationRelation.find_by(invitation_id: params[:id], user_id: session[:user_id])
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

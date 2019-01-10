class GroupRelationsController < ApplicationController

	def index
    	@group_relations = GroupRelation.where(user_id: session[:user_id])
    	get_invitation_num
	end

	def show
		@group_relations = GroupRelation.where(group_id: params[:id])
		@users_in = User.where(id: GroupRelation.where(group_id: params[:id]).select(:user_id))
		@users_invited = User.where(id: GroupInvitation.where(group_id: params[:id], status: 0).select(:receiver_id))
		@users_out = User.where.not(id: GroupRelation.where(group_id: params[:id]).select(:user_id)).where.not(id: GroupInvitation.where(group_id: params[:id], status: 0).select(:receiver_id))
		@group = Group.find(params[:id])
		get_invitation_num
	end

	def create
		invited_users = User.find(params[:user][:id])

		begin
			invited_users.each do |invited_user|
				GroupRelation.create(
					group_id: params[:group_id],
					user_id: invited_user.id,
				)
			end
		rescue => e
			p e
		end
		redirect_to :action => "show", :id => params[:group_id]
	end

	private

	def group_relation_params
		params.require(:group_relation).permit(:group_id, :user_id)
	end
end
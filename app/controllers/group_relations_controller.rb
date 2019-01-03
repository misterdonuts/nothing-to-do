class GroupRelationsController < ApplicationController

	def index
    	@group_relations = GroupRelation.where(user_id: session[:user_id])
	end

	def show
		@group_relations = GroupRelation.where(group_id: params[:id])
		@users_in = User.where(id: GroupRelation.where(group_id: params[:id]).select(:user_id))
		@users_out = User.where.not(id: GroupRelation.where(group_id: params[:id]).select(:user_id))
		@group = Group.find(params[:id])
	end

	def create
		p "paramsを表示"
		p params[:group_id]
		p params[:user][:id]

		@new_users = User.find(params[:user][:id])

		begin
			@new_users.each do |new_user|
				GroupRelation.create(
					group_id: params[:group_id],
					user_id: new_user.id,
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
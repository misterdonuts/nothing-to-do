class GroupRelationsController < ApplicationController
	def show
		@group_relations = GroupRelation.where(group_id: params[:id])
		@users_in = User.where(id: GroupRelation.where(group_id: params[:id]).select(:user_id))
		@users_out = User.where.not(id: GroupRelation.where(group_id: params[:id]).select(:user_id))
		@group = Group.find(params[:id])
	end

	def create
	end
end

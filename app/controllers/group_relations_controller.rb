class GroupRelationsController < ApplicationController
	def show
		@users = User.all
		@group = Group.find(params[:id])
		@group_relations = GroupRelation.where(group_id: params[:id])
	end
end

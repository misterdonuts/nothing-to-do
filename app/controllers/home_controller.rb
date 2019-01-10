class HomeController < ApplicationController
	def index
    	if session[:user_id].blank?
      		redirect_to new_session_path
        else
            @login_user = User.find(session[:user_id])
            if params[:is_search].to_i == 1
                search_text = '%' + params[:text] + '%'
                @users = User.where(id: GroupRelation.where(group_id: GroupRelation.where(user_id: session[:user_id]).select(:group_id)).select(:user_id)).where.not(id: session[:user_id]).where('user_name like ?', search_text)
            else
                @users = User.where(id: GroupRelation.where(group_id: GroupRelation.where(user_id: session[:user_id]).select(:group_id)).select(:user_id)).where.not(id: session[:user_id])
            end
            @invitation_relations = InvitationRelation.where(user_id: session[:user_id])
            @invitations = Invitation.where(user_id: session[:user_id])
            get_invitation_num
    	end
	end
	
end

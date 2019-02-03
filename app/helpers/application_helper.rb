# frozen_string_literal: true

module ApplicationHelper
  def get_invitation_num
    # headerのメッセージ表示用
    invitation_relations = InvitationRelation.where(user_id: session[:user_id])
    @active_invitation_num = 0
    invitation_relations.each do |i|
      @active_invitation_num += 1 if i.invitation.remain_minutes > 0
    end
  end
end

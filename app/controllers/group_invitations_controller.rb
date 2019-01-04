class GroupInvitationsController < ApplicationController
  before_action :set_group_invitation, only: [:show, :edit, :update, :destroy]

  # GET /group_invitations
  # GET /group_invitations.json
  def index
    @group_invitations = GroupInvitation.where(receiver_id: session[:user_id], status: 0)
  end

  # GET /group_invitations/1
  # GET /group_invitations/1.json
  def show
  end

  # GET /group_invitations/new
  def new
    @group_invitation = GroupInvitation.new
  end

  # GET /group_invitations/1/edit
  def edit
  end

  # POST /group_invitations
  # POST /group_invitations.json
  def create
    invited_users = User.find(params[:user][:id])
    begin
      invited_users.each do |invited_user|
        GroupInvitation.create(
          group_id: params[:group_id],
          receiver_id: invited_user.id,
          user_id: session[:user_id],
          status: 0,
        )
      end
    rescue => e 
      p e
    end
    redirect_to group_relation_path(params[:group_id])
  end

  # PATCH/PUT /group_invitations/1
  # PATCH/PUT /group_invitations/1.json
  def update
    group_invitation = GroupInvitation.where(id: params[:id])
    begin
      group_invitation.update(status: params[:status])
    rescue => e
      p e
    end
    redirect_to group_invitations_path
  end

  # DELETE /group_invitations/1
  # DELETE /group_invitations/1.json
  def destroy
    @group_invitation.destroy
    respond_to do |format|
      format.html { redirect_to group_invitations_url, notice: 'Group invitation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_invitation
      @group_invitation = GroupInvitation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_invitation_params
      params.require(:group_invitation).permit(:group_id, :user_id, :sender_id, :status)
    end
end

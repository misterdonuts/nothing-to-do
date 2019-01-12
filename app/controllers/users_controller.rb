class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if params[:is_search].to_i == 1
      search_text = '%' + params[:text] + '%'
      @users = User.all.where('user_name like ?', search_text)
    else
      @users = User.all
    end
    get_invitation_num
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    get_invitation_num
  end

  # GET /users/new
  def new
    @user = User.new
    get_invitation_num
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    get_invitation_num
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
    if current_user == @user
      if @user.update(user_params)
        redirect_to edit_user_path
      else
        redirect_to edit_user_path
      end
    else
        redirect_to root_url
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :user_name, :invite_num, :be_invited_num, :accept_num, :password, :password_confirmation, :image, :is_free, :account_name)
    end
end

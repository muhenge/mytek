class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    #@user = User.friendly.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:avatar,:firstname, :avatar, :lastname, :email, :username, :about, :bio, :career_id, skills:[])
  end
end

class UsersController < ApplicationController
  #before_action :authenticate_user!

  def index
  end

  def show
    
  end
  def user_params
    params.require(:user).permit(:firstname, :avatar, :lastname, :email, :username, :about, :bio, :career_id, skills:[])
  end
end
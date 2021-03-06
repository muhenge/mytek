class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    render json: {status: :ok, message:'You are following this user', data: user}
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    render json: {status: :ok, message:'You have unfollowed this user', data: @user}
  end
  private

    def user_params
        params.require(:user).permit(:firstname,:avatar, :lastname, :email, :username, :about, :bio, :career_id, skills:[])
    end


    def set_user
        @user = User.find(params[:id])
    end 
end

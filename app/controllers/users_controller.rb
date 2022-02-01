class UsersController < ApplicationController
  before_action :set_user, only: %i[show user_connections] 
  before_action :authenticate_user!

  def index
  end

  def user_connections
    @user_following = current_user.following
    @user_follow = current_user.followers
  end

  def show
    #@user = User.friendly.find(params[:id])
    @user_following = current_user.following
    @user_follow = current_user.followers 
    @skill = Skill.new
    @user_skills = @user.skills
    @user_posts = @user.posts.most_recent.limit(5)
  end

  private

  def user_params
    params.require(:user).permit(:avatar,:firstname, :avatar, :lastname, :email, :username, :about, :bio, :career_id, skills:[])
  end

  def set_user
    @user = params[:id] ? User.friendly.find(params[:id]) : current_user
  end
end

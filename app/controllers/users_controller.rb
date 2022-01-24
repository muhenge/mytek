class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    #@user = User.friendly.find(params[:id])
    @user = params[:id] ? User.friendly.find(params[:id]) : current_user
    @skill = Skill.new
    @user_skills = @user.skills
    @user_posts = @user.posts.most_recent.limit(5)
  end
  def user_params
    params.require(:user).permit(:avatar,:firstname, :avatar, :lastname, :email, :username, :about, :bio, :career_id, skills:[])
  end
end

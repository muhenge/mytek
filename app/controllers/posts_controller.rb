class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update edit destroy vote]
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :show, :destory, :vote]
  respond_to :js, :json, :html
  def index
    
    @posts = Post.all.includes(:user, :comments, :likes, :career, :following).most_recent
    @posts_career = Post.all.includes(:career).most_recent
    @user_posts = current_user.posts.most_recent
    @career_post = current_user.career.posts
    @comments = current_user.comments.most_recent
    @comments_new = Comment.new
    @posts = Post.most_recent
  end

  def show
   @post_comments = @post.comments.includes(:user).most_recent.limit(5)
  end

  def create
    @post = current_user.posts.build(post_params)
    if  @post.save
      redirect_to posts_path
      flash[:notice] = 'Posted successfully'
    else
      flash[:alert] = 'Not posted,must be 10 world min, try again!'
      redirect_to posts_path
    end
  end

  def edit; end

  def update
    @post.update(post_params)
    redirect_to posts_path
  end

  def vote
    if !current_user.liked? @post
      @post.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js { render layout: false }
      end
    elsif current_user.liked? @post
      @post.unliked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js { render layout: false }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:comment_id,:image,:user_slug, :created_at, :skill_id, :career_id)
  end


  def set_post
    @post = Post.find(params[:id])
  end
end

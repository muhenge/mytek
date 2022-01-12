class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update edit destroy vote]
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :show, :destory, :vote]
  respond_to :js, :json, :html
  def index
    @user_posts = current_user.posts.most_recent
    @career_post = current_user.career.posts
    @comments = current_user.comments.most_recent
    @comments_new = Comment.new
    @posts = Post.most_recent
  end

  def show
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
    elsif current_user.liked? @post
      @post.unliked_by current_user
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:comment_id,:image,:user_id, :created_at, :skill_id, :career_id)
  end

    private

  def set_post
    @post = Post.find(params[:id])
  end
end

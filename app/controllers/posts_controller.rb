class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :like]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]

  def index
    if params[:query].present?
      @posts = Post.where("title LIKE ? OR content LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @posts = Post.all
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if current_user == @post.user
      @post.destroy
      redirect_to posts_path, notice: 'Post was successfully deleted.'
    else
      redirect_to posts_path, alert: 'You are not authorized to delete this post.'
    end
  end

  def like
    # Check if the user has already liked the post to prevent duplicate likes
    unless @post.likes.exists?(user: current_user)
      @post.likes.create(user: current_user)
      flash[:notice] = 'You liked this post.'
    else
      flash[:alert] = 'You have already liked this post.'
    end
    redirect_to @post
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end

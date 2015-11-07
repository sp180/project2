class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = params[:user_id]

    if @post.save
      redirect_to user_posts_path(@post.user_id)
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to user_posts_path(@post.user_id)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy(post_params)
    redirect_to user_posts_path(@post.user_id)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
    :text,
    :image_url
    )
  end
end

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if current_user
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end

  end

  private
  def post_params
    params.require(:post).permit(:title, :media_url, :user_id)
  end
end

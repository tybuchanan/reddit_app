class PostsController < ApplicationController

  def index
    if user_signed_in?
      @posts = Post.all
    else
      redirect_to "root_path"
    end
  end

  def up_vote
    @post = Post.increment_counter(:upvote, params[:id])
    redirect_to :back
  end

  def down_vote
    @post = Post.decrement_counter(:downvote, params[:id])
    redirect_to :back
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end

private
  def post_params
    params[:post].permit(:title, :description, :url, :comments_attributes=>[:description])
  end

end

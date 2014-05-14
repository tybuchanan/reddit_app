class CommentsController < ApplicationController
before_filter :load_post
  def index
    @comments = @post.comments.all.order(:description).reverse
    @user = current_user
  end

  def show
    @comment = @post.comments.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_comments_path(@post)
    else
      render 'new'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_comments_path(@post)
  end

private
  def comment_params
    params.require(:comment).permit(:description)
  end

  # create this method so we don't need the below line in every comments method
  def load_post
    @post = Post.find(params[:post_id])
  end

end

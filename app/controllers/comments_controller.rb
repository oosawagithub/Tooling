class CommentsController < ApplicationController
  def create
  	post = Post.find(params[:post_id])
  	comment = post.comments.new(comment_params)
  	comment.save
    redirect_to post_path(post.id)
  end

  def destroy
  	comment = Comment.find(params[:id])
  	comment.destroy
  end

  private
  def comment_params
  	params.require(:comment).permit(:post_id, :name, :body)
  end
end

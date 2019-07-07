class CommentsController < ApplicationController
  def create
  	post = Post.find(params[:post_id])
  	comment = Comment.new(comment_params)
  	comment.save
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

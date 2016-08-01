class CommentsController < ApplicationController
  #index, show, new, edit, create, update and destroy
  before_filter :find_commentable
  
   
  def show
    @comment = Comment.find(params[:id])   
    @replyable = @comment
    @item = @comment.commentable_type.constantize.find(@comment.commentable_id)
  end
  
  def create
    @comment = @commentable.comments.create(comments_params)
    redirect_to @commentable
  end

private
  def comments_params
    params.require(:comment).permit(:autor, :comment)
  end
  
  def find_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end

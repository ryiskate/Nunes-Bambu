class CommentsController < ApplicationController
  def create
    @lamp = Lamp.find(params[:lamp_id])
    @comment = @lamp.comments.create(comments_params)
    @comment.autor = current_user.first_name
    @comment.save
    redirect_to lamp_path(@lamp)
  end

private
  def comments_params
    params.require(:comment).permit(:autor, :comment)
  end
  
end

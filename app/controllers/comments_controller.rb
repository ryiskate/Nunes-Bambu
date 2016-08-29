class CommentsController < ApplicationController
  #index, show, new, edit, create, update and destroy
   
  def for_product
   @comments = Comment.for_product(params[:product_id])
   
   render :json => @comments.map{ |c| c.to_json }
  end
  
  def create
    comment = Comment.new(comments_params)
    comment.user = current_user
    comment.save
    
    render :json => comment.to_json
  end

private
  def comments_params
    params.require(:comment).permit(:comment, :product_id)
  end
  
end

class RepliesController < ApplicationController
   before_filter :find_replyable
  
  def create
    @reply = @replyable.replies.create(reply_params)
    redirect_to @replyable
  end

private
  def reply_params
    params.require(:reply).permit(:autor, :reply)
  end
  
  def find_replyable
    resource, id = request.path.split('/')[1,2]
    @replyable = resource.singularize.classify.constantize.find(id)
  end
end

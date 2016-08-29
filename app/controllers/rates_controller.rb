class RatesController < ApplicationController

  def create
    rate = Rate.new
    rate.rate = params[:rate][:rate]
    rate.product_id = params[:rate][:product_id]
    rate.save
    
    render :json => Product.find(rate.product_id).rate_average
  end

  def update
  end
  
private
  
  def rates_params
    params.require(:rate).permit(:autor, :rate)
  end
  
  def find_commentable
    resource, id = request.path.split('/')[1,2]
    @rateable = resource.singularize.classify.constantize.find(id)
  end
  
end
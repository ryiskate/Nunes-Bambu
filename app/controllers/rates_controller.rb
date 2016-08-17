class RatesController < ApplicationController
  
  before_filter :find_commentable
  
  def create
    @rate = @rateable.rates.create(rates_params)
    redirect_to @rateable
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
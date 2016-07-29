class KitchenwaresController < ApplicationController
  
  def index
  @thing = Kitchenware.all
  end
  
  def show
  @kitchenware = Kitchenware.find(params[:id])
  @item = @kitchenware
  @commentable = @kitchenware
  end

end

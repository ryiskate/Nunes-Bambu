class OrdersController < ApplicationController
  
  def add_item_to_cart 
    order = current_user.get_cart
    order.add_item(params[:order_item])
    order.save
  end
  
private

  def order_params
    
  end
  
end

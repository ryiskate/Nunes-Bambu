class OrdersController < ApplicationController
  
  def cart
    @order = current_user.orders.find_by_status('cart')
  end
  
  def add_item_to_cart 
    order = current_user.get_cart
    order.add_item(params[:orders][:product_id], params[:orders][:quantity])
    order.save
    
    redirect_to product_path(params[:orders][:product_id])
  end
  
private

  def order_params
    
  end
  
end

class OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end
  
  def cart
    @order = current_user.orders.find_by_status('cart')
  end
  
  def add_item_to_cart 
    order = current_user.get_cart
    order.add_item(params[:orders][:product_id], params[:orders][:quantity])
    order.save
  end
  
  def minicart
    @order = current_user.orders.find_by_status('cart')
    render layout: false
  end
  
  def checkout
    order = current_user.orders.find_by_status('cart')
    order.payment!
    order.save
    OrderMailer.processing(order.user, order).deliver_now
  end
  
private

  def order_params
    
  end
  
end

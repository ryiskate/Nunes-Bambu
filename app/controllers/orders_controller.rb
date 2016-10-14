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
    @order = current_user.orders.find_by_status('cart')
    @order.payment!
    @order.address = params[:order][:address]
    @order.save
    OrderMailer.payment(@order).deliver_later
    redirect_to checkout_completed_path
  end
  
  def checkout_completed
    @order = current_user.orders.last
  end
  
private

  def order_params
    
  end
  
end

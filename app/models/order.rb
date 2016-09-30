class Order < ApplicationRecord
  
  enum status: [ :cart, :payment, :making, :delivering, :delivered ]

  before_save :update_total_value
  
  belongs_to :user
  has_many :order_items
  
  def update_total_value
    self.order_items.each { |i| i.value = i.product.price }
    self.total_value = self.order_items.inject(0) { |sum,i| sum + (i.value * i.quantity) }
  end
  
  def add_item(product_id, quantity)
    product = Product.find(product_id)
    order_item = OrderItem.new(value: product.price, quantity: quantity, product: product)
    self.order_items << order_item
    order_item
  end
  
  def status_to_human
    I18n.t("activerecord.attributes.order.status.#{status}")
  end
  
  def created_at_to_human
    created_at.strftime("%d/%m/%Y")
  end
  
end

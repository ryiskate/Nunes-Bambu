class Order < ApplicationRecord
  
  enum status: [ :cart, :payment, :making, :to_deliver, :delivering, :delivered ]

  before_save :update_total_value
  
  belongs_to :user
  has_many :order_items
  
  scope :waiting_payment, -> { where(status: 'payment') }
  scope :making, -> { where(status: 'making') }
  scope :to_deliver, -> { where(status: 'to_deliver') }
  scope :delivered, -> { where(status: 'delivering') }
  
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
  
  def user_name
    user.full_name
  end
  
  def status_to_user
    return I18n.t("activerecord.attributes.order.status.making") if status == 'to_deliver'
    I18n.t("activerecord.attributes.order.status.#{status}")
  end
  
end

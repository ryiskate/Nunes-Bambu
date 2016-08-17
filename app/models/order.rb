class Order < ApplicationRecord

  before_save :update_total_value
  
  belongs_to :user
  has_many :order_items
  
  def update_total_value
    self.order_items.each { |i| i.value = i.product.price }
    self.total_value = self.order_items.inject(0) { |sum,i| sum + (i.value * i.quantity) }
  end
end

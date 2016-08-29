require 'rails_helper'

RSpec.describe Order, type: :model do
  
  let(:user) { create(:user) }
  let(:order) { Order.new }
  let(:product_1) { create(:lamp) }
  let(:product_2) { create(:lamp, price: 10) }
  let(:order_item_1) { OrderItem.new( product: product_1, quantity: 2) }
  let(:order_item_2) { OrderItem.new( product: product_2, quantity: 3) }
  
  before do
      order.user = user
      order.order_items << order_item_1
      order.order_items << order_item_2
      order.save
  end
  
  it 'sums the value of items in an order' do
    order.reload
    expect(order.total_value).to eq(70)
  end
  
  describe '#add_item' do
    let(:product_3) { create(:lamp, price: 10.25) }
    let(:item) { order.add_item(product_3.id, 5) }
    it { expect(item.product_id).to eq(product_3.id) }
    it { expect(item.quantity).to eq(5) }
    it { expect(item.value).to eq(10.25) }
  end
    
end

require 'rails_helper'

RSpec.describe User, type: :model do 
 
  let(:user) { create(:user) }
 
  it { expect(user.get_cart).to be_a(Order) }
  
  context 'has no orders' do
    it { expect(user.get_cart.persisted?).to be_falsey }
    it { expect(user.get_cart.status).to eq('cart') }
  end
  
  context 'has an order' do
    
    before { create(:order, status: status, user: user) }
    
    context 'with cart status' do
      let(:status) {'cart'}
      it { expect(user.get_cart.persisted?).to be_truthy }
      it { expect(user.get_cart.status).to eq('cart') }
    end
    
    context 'with other than cart status' do
      let(:status) {'payment'}
      it { expect(user.get_cart.persisted?).to be_falsey }
      it { expect(user.get_cart.status).to eq('cart') }
    end
  end
  
 end